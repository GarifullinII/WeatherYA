//
//  ListTableViewController.swift
//  WeatherYA
//
//  Created by Ildar Garifullin on 28/10/2022.
//

import UIKit

class ListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchWeather()
    }
    
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
