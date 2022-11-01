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
    var nameCitiesArray = ["Moscow", "Permian", "Irkutsk", "Tomsk", "Kainsk", "Novosibirsk", "Ust-Kut", "Rybinsk", "Ufa", "Nizhnevartovsk", "Barabinsk", "Purovsk", "Saint Petersburg", "Listvyanka", "Urengoy"]
    
    let networkWeatherManager = NetworkWeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCitiesArray.count)
        }
        
        addCities()
    }
    
    @IBAction func pressPlusButton(_ sender: Any) {
        alertPlusCity(name: "City", placeholder: "Write name of city") { (city) in
            self.nameCitiesArray.append(city)
            self.citiesArray.append(self.emptyCity)
            self.addCities()
        }
    }
    
    
    // MARK: - Add cities in array
    
    func addCities() {
        getCityWeather(citiesArray: self.nameCitiesArray) { (index, weather ) in
            
            self.citiesArray[index] = weather
            self.citiesArray[index].name = self.nameCitiesArray[index]
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
//            let maxIndex = self.citiesArray.count
//            for i in 0..<maxIndex {
//                self.citiesArray[index] = weather
//                self.citiesArray[index].name = self.nameCitiesArray[index]
//                print(self.citiesArray)
//            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        
        var weather = Weather()
        weather = citiesArray[indexPath.row]
        
        cell.configure(weather: weather)

        return cell
    }
    
    // MARK: - Delete cell
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in
            
            let editingRow = self.nameCitiesArray[indexPath.row]
            
            if let index = self.nameCitiesArray.firstIndex(of: editingRow) {
                self.citiesArray.remove(at: index)
            }
            
            tableView.reloadData()
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    // MARK: - NAvigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let cityWeather = citiesArray[indexPath.row]
            
            let dstVC = segue.destination as! DetailViewController
            dstVC.weatherModel = cityWeather
        }
    }
}
