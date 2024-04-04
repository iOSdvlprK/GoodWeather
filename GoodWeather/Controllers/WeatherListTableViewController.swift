//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by joe on 3/21/24.
//

import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    private var weatherListViewModel = WeatherListViewModel()
    private var datasource: WeatherDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.datasource = WeatherDataSource(self.weatherListViewModel)
        self.tableView.dataSource = self.datasource
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            self.prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingsTableViewController" {
            self.prepareSegueForSettingsTableViewController(segue: segue)
        }
    }
    
    private func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("UINavigationController not found")
        }
        guard let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableViewController not found")
        }
        settingsTVC.delegate = self
    }
    
    private func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("UINavigationController not found")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not found")
        }
        addWeatherCityVC.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension WeatherListTableViewController: SettingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
}
