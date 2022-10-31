//
//  NetworkWeatherManager.swift
//  WeatherYA
//
//  Created by Ildar Garifullin on 28/10/2022.
//

import Foundation

struct NetworkWeatherManager {
    
    // MARK: - Fetch
    
    func fetchWeather(latitude: Double, longitude: Double, completionHandler: @escaping (Weather) -> Void) {
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)"
        
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

//            print(String(data: data, encoding: .utf8)!)
            if let weather = self.parseJSON(withData: data) {
                completionHandler(weather)
            }
        }
        
        task.resume()
    }
    
    // MARK: - Parse JSON
    func parseJSON(withData data: Data) -> Weather? {
        let decoder = JSONDecoder()
        
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let weather = Weather(weatherData: weatherData) else {
                return nil
            }
            
            return weather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
