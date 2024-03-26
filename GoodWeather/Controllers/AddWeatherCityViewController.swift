//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by joe on 3/21/24.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    @IBOutlet weak var cityNameTextField: UITextField!
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric")!
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            
            Webservice().load(resource: weatherResource) { [weak self] result in
                if let weatherVM = result, let delegate = self?.delegate {
                    delegate.addWeatherDidSave(vm: weatherVM)
                    self?.dismiss(animated: true)
                }
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true)
    }
}
