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
    let currentTemperature: TemperatureViewModel
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureViewModel: Decodable {
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
