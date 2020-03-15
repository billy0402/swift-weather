//
//  WeatherViewModel.swift
//  swift-weather
//
//  Created by User on 2020/3/16.
//  Copyright © 2020 NTUB. All rights reserved.
//

import Foundation

struct WeatherViewModel: Decodable {
    let name: String
    let main: TemperatureViewModel
}

struct TemperatureViewModel: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}
