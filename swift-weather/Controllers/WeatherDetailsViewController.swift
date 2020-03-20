//
//  WeatherDetailsViewController.swift
//  swift-weather
//
//  Created by User on 2020/3/20.
//  Copyright © 2020 NTUB. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {

    var weatherViewModel: WeatherViewModel?
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupVMBindings()
    }
    
    private func setupVMBindings() {
        if let weatherVM = self.weatherViewModel {
            weatherVM.name.bind {
                self.cityNameLabel.text = $0
            }
            
            weatherVM.currentTemperature.temperature.bind {
                self.currentTemperatureLabel.text = $0.formatAsDegree
            }
            
            weatherVM.currentTemperature.temperatureMin.bind {
                self.minTemperatureLabel.text = $0.formatAsDegree
            }
            
            weatherVM.currentTemperature.temperatureMax.bind {
                self.maxTemperatureLabel.text = $0.formatAsDegree
            }
        }
        
        // change the value after few seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.weatherViewModel?.name.value = "Boston"
        }
    }

}
