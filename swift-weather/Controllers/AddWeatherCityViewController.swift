//
//  AddWeatherCityViewController.swift
//  swift-weather
//
//  Created by User on 2020/3/15.
//  Copyright © 2020 NTUB. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {

    private var addCityViewModel = AddWeatherCityViewModel()
    var delegate: AddWeatherDelegate?

    @IBOutlet weak var cityNameTextField: BindingTextField! {
        didSet {
            self.cityNameTextField.bind {
                self.addCityViewModel.city = $0
            }
        }
    }
    
    @IBOutlet weak var stateTextField: BindingTextField! {
        didSet {
            self.stateTextField.bind {
                self.addCityViewModel.state = $0
            }
        }
    }
    
    @IBOutlet weak var zipCodeTextField: BindingTextField! {
        didSet {
            self.zipCodeTextField.bind {
                self.addCityViewModel.zipCode = $0
            }
        }
    }
    
    @IBAction func saveCityButtonPressed() {
        print(self.addCityViewModel)
        
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=7d2dd8c9c5578b741c7735ad3f0d39ea&units=metric")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                
                return weatherVM
            }
            
            WebService().load(resource: weatherResource) { [weak self] result in
                if let weatherVM = result {
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }

}
