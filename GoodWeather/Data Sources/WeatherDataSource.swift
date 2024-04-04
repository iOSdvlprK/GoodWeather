//
//  WeatherDataSource.swift
//  GoodWeather
//
//  Created by joe on 4/4/24.
//

import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {
    let cellIdentifier: String = "WeatherCell"
    private var weatherListViewModel: WeatherListViewModel
    
    init(_ weatherListViewModel: WeatherListViewModel) {
        self.weatherListViewModel = weatherListViewModel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.weatherViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? WeatherCell else {
            fatalError("\(self.cellIdentifier) not found")
        }
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        cell.cityNameLabel.text = weatherVM.name
        cell.temperatureLabel.text = weatherVM.currentTemperature.temperature.formatAsDegree
        return cell
    }
}
