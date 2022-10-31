//
//  ListTableViewCell.swift
//  WeatherYA
//
//  Created by Ildar Garifullin on 31/10/2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet var nameCityLabel: UILabel!
    
    @IBOutlet var conditionCityLabel: UILabel!
    
    @IBOutlet var tempCityLabel: UILabel!
    
    // MARK: - Fill IBOutlet
    
    func configure(weather: Weather) {
        self.nameCityLabel.text = weather.name
        self.conditionCityLabel.text = weather.condition
        self.tempCityLabel.text = weather.temperatureString
    }
    
    
}
