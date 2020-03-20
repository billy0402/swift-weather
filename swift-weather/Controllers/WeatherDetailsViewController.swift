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
        
        if let weatherViewModel = self.weatherViewModel {
            self.cityNameLabel.text = weatherViewModel.name
            self.currentTemperatureLabel.text = weatherViewModel.currentTemperature.temperature.formatAsDegree
        }
    }

}
