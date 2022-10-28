//
//  ListTableViewController.swift
//  WeatherYA
//
//  Created by Ildar Garifullin on 28/10/2022.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    let networkWeatherManager = NetworkWeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherManager.fetchWeather()
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
