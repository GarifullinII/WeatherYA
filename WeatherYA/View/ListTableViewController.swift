//
//  ListTableViewController.swift
//  WeatherYA
//
//  Created by Ildar Garifullin on 28/10/2022.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    let emptyCity = Weather()
    
    var citiesArray = [Weather]()
    let nameCitiesArray = ["Moscow", "New Urengoy", "Irkutsk", "Tomsk", "Kainsk", "Novosibirsk", "Ust-Kut", "Rybinsk", "Ufa", "Nizhnevartovsk"]
    
    let networkWeatherManager = NetworkWeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCitiesArray.count)
        }
        
        addCities()
    }
    
    // MARK: - Add cities in array
    
    func addCities() {
        getCityWeather(citiesArray: self.nameCitiesArray) { (index, weather ) in
            
            self.citiesArray[index] = weather
            self.citiesArray[index].name = self.nameCitiesArray[index]
            print(self.citiesArray)
            
//            let maxIndex = self.citiesArray.count
//            for i in 0..<maxIndex {
//                self.citiesArray[index] = weather
//                self.citiesArray[index].name = self.nameCitiesArray[index]
//                print(self.citiesArray)
//            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        return cell
    }
}
