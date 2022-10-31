//
//  DetailViewController.swift
//  WeatherYA
//
//  Created by Ildar Garifullin on 31/10/2022.
//

import UIKit
import SwiftSVG

class DetailViewController: UIViewController {

    @IBOutlet var nameCityLabel: UILabel!
    
    @IBOutlet var viewCity: UIView!
    
    @IBOutlet var conditionLabel: UILabel!
    
    @IBOutlet var temperaturaCity: UILabel!
    
    @IBOutlet var pressureLabel: UILabel!
    
    @IBOutlet var windSpeedLabel: UILabel!
    
    @IBOutlet var minTempLabel: UILabel!
    
    @IBOutlet var maxTempLabel: UILabel!
    
    var weatherModel: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshLabels()
    }

    // MARK: - Refresh labels
    
    func refreshLabels() {
        
        self.nameCityLabel.text = weatherModel?.name
        
        let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(weatherModel!.conditionCode).svg")
        let weatherImage = UIView(SVGURL: url!) { (image) in
            image.resizeToFit(self.viewCity.bounds)
        }
        
        self.viewCity.addSubview(weatherImage)
        
        self.conditionLabel.text = weatherModel?.condition
        
        self.temperaturaCity.text = "\((weatherModel?.temperature)!)"
        
        self.pressureLabel.text = "\((weatherModel?.pressureMm)!)"
        
        self.windSpeedLabel.text = "\((weatherModel?.windSpeed)!)"
        
        self.minTempLabel.text = "\((weatherModel?.tempMin)!)"
        
        self.maxTempLabel.text = "\((weatherModel?.tempMax)!)"
    }
}
