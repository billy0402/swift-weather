//
//  WeatherListViewModel.swift
//  swift-weather
//
//  Created by User on 2020/3/16.
//  Copyright © 2020 NTUB. All rights reserved.
//

import Foundation

struct WeatherListViewModel {

    private(set) var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ vm: WeatherViewModel) {
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        self.weatherViewModels[index]
    }
    
    mutating private func toCelsius() {
        self.weatherViewModels = self.weatherViewModels.map { vm in
            let weatherViewModel = vm
            weatherViewModel.currentTemperature.temperature.value = (weatherViewModel.currentTemperature.temperature.value - 32) * 5 / 9
            return weatherViewModel
        }
    }
    
    mutating private func toFahrenheit() {
        self.weatherViewModels = self.weatherViewModels.map { vm in
            let weatherViewModel = vm
            weatherViewModel.currentTemperature.temperature.value = (weatherViewModel.currentTemperature.temperature.value * 9 / 5) + 32
            return weatherViewModel
        }
    }
    
    mutating func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            self.toCelsius()
        case .fahrenheit:
            self.toFahrenheit()
        }
    }

}
