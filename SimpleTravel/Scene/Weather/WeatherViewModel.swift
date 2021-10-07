//
//  WeatherViewModel.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 21/01/2021.
//
import CoreLocation
import Foundation

class WeatherViewModel {
    var nombre: Float?
    var weatherHandler: (_ weather: WeatherInformation) -> Void = { _  in }
    
    func getWeather(city: String) {
        WeatherClient.shared.getWeather(city: city) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let weather):
                print("hello")
                let first = weather.main
                let temperature = String(first.temp)
                let tempMin = String(first.tempMin)
                let tempMax = String(first.tempMax)
                let feelsLike = String(first.feelsLike)
                let description = String(weather.weather.first!.description)
                let icon = String(weather.weather.first!.icon)
                let weatherInformation = WeatherInformation(temperature: temperature, tempMax: tempMax, tempMin: tempMin, feelsLike: feelsLike, description: description, icon: icon)
                self.weatherHandler(weatherInformation)
            }
        }
    }
}

struct WeatherInformation {
    let temperature: String
    let tempMax: String
    let tempMin: String
    let feelsLike: String
    let description: String
    let icon: String
}
