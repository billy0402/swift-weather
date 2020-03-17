//
//  SettingsViewModel.swift
//  swift-weather
//
//  Created by User on 2020/3/17.
//  Copyright © 2020 NTUB. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {

    var displayName: String {
        get {
            switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }

}

struct SettingsViewModel {
    let units = Unit.allCases
}
