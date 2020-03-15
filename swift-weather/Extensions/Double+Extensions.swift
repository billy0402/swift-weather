//
//  Double+Extensions.swift
//  swift-weather
//
//  Created by User on 2020/3/16.
//  Copyright © 2020 NTUB. All rights reserved.
//

import Foundation

extension Double {

    var formatAsDegree: String {
        return String(format: "%.0f°", self)
    }

}
