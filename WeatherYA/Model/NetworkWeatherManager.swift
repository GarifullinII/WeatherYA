//
//  NetworkWeatherManager.swift
//  WeatherYA
//
//  Created by Ildar Garifullin on 28/10/2022.
//

import Foundation

struct NetworkWeatherManager {
    
    // MARK: - Fetch
    
    func fetchWeather() {
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=66.089534&lon=76.690928"
        
        // get url
        guard let url = URL(string: urlString) else { return }
        
        // create request
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        // create URLSession
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }

            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
}
