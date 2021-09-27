//
//  TranslateClient.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 26/09/2021.
//

import Foundation

class TranslateClient {
    static var shared = TranslateClient()
    private init() {}
    private var task: URLSessionDataTask?
    private var translateClientSession = URLSession(configuration: .default)
    init(currencySession: URLSession) {
        self.translateClientSession = currencySession
    }
    
    func getTranslate(city: String, callback: @escaping (Result<CityWeather, Error>) -> Void) {
//        let baseURL = "https://api.openweathermap.org/"
//        let path = "data/2.5/"
//        let param = "weather?q=\(city)&units=metric&lang=fr&appid=\(weatherApiKey)"
//        guard let weatherURL = URL(string: "\(baseURL)\(path)\(param)") else { return }
        task?.cancel()
        task = translateClientSession.dataTask(with: weatherURL) { (data, response, error) in
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
