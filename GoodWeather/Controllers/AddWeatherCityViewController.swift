//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by joe on 3/21/24.
//

import UIKit

class AddWeatherCityViewController: UIViewController {
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityButtonPressed() {
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric")!
            let weatherResource = Resource<Any>(url: weatherURL) { data in
                return data
            }
            
            Webservice().load(resource: weatherResource) { result in
                
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true)
    }
}
