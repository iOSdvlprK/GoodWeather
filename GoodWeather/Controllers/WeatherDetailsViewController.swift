//
//  WeatherDetailsViewController.swift
//  GoodWeather
//
//  Created by joe on 4/2/24.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let weatherVM = self.weatherViewModel {
            self.cityNameLabel.text = weatherVM.name
            self.currentTemperatureLabel.text = weatherVM.currentTemperature.temperature.formatAsDegree
        }
    }
}
