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
        
        setupVMBindings()
    }
    
    private func setupVMBindings() {
        if let weatherVM = self.weatherViewModel {
            weatherVM.name.bind { self.cityNameLabel.text = $0 }
            weatherVM.currentTemperature.temperature.bind { self.currentTemperatureLabel.text = $0.formatAsDegree }
        }
        
        // change the value after few seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.weatherViewModel?.name.value = "Boston"
        }
    }
}
