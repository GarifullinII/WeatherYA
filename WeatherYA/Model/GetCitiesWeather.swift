//
//  GetCitiesWeather.swift
//  WeatherYA
//
//  Created by Ildar Garifullin on 30/10/2022.
//

import Foundation
import CoreLocation

// MARK: Get city weather

let networkWeatherManager = NetworkWeatherManager()

func getCityWeather(citiesArray: [String], completionHandler: @escaping (Int, Weather) -> Void) {
    for (index, item) in citiesArray.enumerated() {
        
        getCoordinateFrom(city: item) { (coordinate, error) in
            guard let coordinate = coordinate, error == nil else {
                return
            }
            
            networkWeatherManager.fetchWeather(
                latitude: coordinate.latitude,
                longitude: coordinate.longitude) { (weather) in
                    completionHandler(index, weather)
                }
        }
    }
}

// MARK: Get coordinate cities

func getCoordinateFrom(city: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> ()) {
    CLGeocoder().geocodeAddressString(city) { (placemark, error) in
        completion(placemark?.first?.location?.coordinate, error)
    }
}
