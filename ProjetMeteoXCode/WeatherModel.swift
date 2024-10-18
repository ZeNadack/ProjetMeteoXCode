//
//  WeatherModel.swift
//  ProjetMeteoXCode
//
//  Created by Theo Blanchard on 10/18/24.
//

import Foundation

struct WeatherResponse: Codable {
    let main: Main
    let name: String
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let humidity: Double
}

struct Weather: Codable {
    let description: String
}
