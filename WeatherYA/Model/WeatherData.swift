//
//  WeatherData.swift
//  WeatherYA
//
//  Created by Ildar Garifullin on 28/10/2022.
//

import Foundation

struct WeatherData: Codable {
    
    let info: Info
    let fact: Fact
    let forecasts: [Forecast]
}

struct Info: Codable {
    
    let url: String
}

struct Fact: Codable {
    
    let temp: Int
    let icon: String
    let condition: String
    let windSpeed: Int
    let pressureMm: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case icon
        case condition
        case windSpeed = "wind_speed"
        case pressureMm = "pressure_mm"
    }
}

struct Forecast: Codable {
    
    let parts: Parts
}

struct Parts: Codable {
    
    let day: Day
}

struct Day: Codable {
    
    let tempMin: Int?
    let tempMax: Int?
    
    enum CodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
