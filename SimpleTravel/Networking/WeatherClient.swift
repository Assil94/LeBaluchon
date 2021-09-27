//
//  WeatherClient.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 25/08/2021.
//

import Foundation


class WeatherClient {
    
    
    private let weatherApiKey = valueForAPIKey(named: "openWeatherApiKey")
    static var shared = WeatherClient()
    private init() {}
    private var task: URLSessionDataTask?
    private var weatherSession = URLSession(configuration: .default)
    init(currencySession: URLSession) {
        self.weatherSession = currencySession
    }
    func getWeather(city: String, callback: @escaping (Result<CityWeather, Error>) -> Void) {
        let baseURL = "https://api.openweathermap.org/"
        let path = "data/2.5/"
        let param = "weather?q=\(city)&units=metric&lang=fr&appid=\(weatherApiKey)"
        /// url = "https://api.openweathermap.org/data/2.5/weather?q=London&units=metric&lang=fr&appid="
        guard let weatherURL = URL(string: "\(baseURL)\(path)\(param)") else { return }
        task?.cancel()
        task = weatherSession.dataTask(with: weatherURL) { (data, response, error) in
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                    callback(.failure(NetWorkError.noData))
                    print("erreur")
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(.failure(NetWorkError.badUrl))
                    return
                }
                
                do {
                    let currencyResponse = try JSONDecoder().decode(CityWeather.self, from: data)
                    callback(.success(currencyResponse))
                    print("succes")
                } catch {
                    callback(.failure(NetWorkError.jsonError))
                    print("catch")
                }
            }
        }
        task?.resume()
    }
}



