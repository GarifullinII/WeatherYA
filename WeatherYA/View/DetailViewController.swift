//
//  DetailViewController.swift
//  WeatherYA
//
//  Created by Ildar Garifullin on 31/10/2022.
//

import UIKit

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
    }

    // MARK: - Refresh labels
    
    func refreshLabels() {
        
        self.nameCityLabel.text = weatherModel?.name
        
        self.conditionLabel.text = weatherModel?.conditionCode
        
        self.pressureLabel.text = "\((weatherModel?.pressureMm)!)"
        
        self.windSpeedLabel.text = "\((weatherModel?.windSpeed)!)"
        
        self.minTempLabel.text = "\((weatherModel?.tempMin)!)"
        
        self.maxTempLabel.text = "\((weatherModel?.tempMax)!)"
    }
}
