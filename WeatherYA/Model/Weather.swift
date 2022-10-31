//
//  Weather.swift
//  WeatherYA
//
//  Created by Ildar Garifullin on 28/10/2022.
//

import Foundation

struct Weather {
    
//    var name: String = "Name"
//    var temperature: Int
//    var conditionCode: String
//    var url: String
//    var condition: String
//    var pressureMm: Int
//    var windSpeed: Double
//    var tempMin: Int = 0
//    var tempMax: Int = 0
    
    var name: String = "Name"
    var temperature: Int = 0
    var conditionCode: String = ""
    var url: String = ""
    var condition: String = ""
    var pressureMm: Int = 0
    var windSpeed: Double = 0
    var tempMin: Int = 0
    var tempMax: Int = 0
    
    
    init?(weatherData: WeatherData) {
        
        temperature = weatherData.fact.temp
        conditionCode = weatherData.fact.icon
        url = weatherData.info.url
        condition = weatherData.fact.condition
        pressureMm = weatherData.fact.pressureMm
        windSpeed = weatherData.fact.windSpeed
        tempMin = weatherData.forecasts.first!.parts.day.tempMin!
        tempMax = weatherData.forecasts.first!.parts.day.tempMax!
    }
    
    init() {
    }
}
