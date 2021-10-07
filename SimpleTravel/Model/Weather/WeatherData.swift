//
//  WeatherData.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 22/01/2021.
//

import Foundation


// structures to manage data
struct CityWeather: Decodable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let clouds: Cloud
}

struct Weather: Decodable {
    let main: String
    let description, icon: String
}

struct Main: Decodable {
    let temp: Float
    let feelsLike: Float
    let tempMin: Float
    let tempMax: Float
    
    enum CodingKeys: String, CodingKey {
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case temp
    }
}

struct Wind: Decodable {
    let speed: Float
}

struct Cloud: Decodable {
    let all: Float
}
