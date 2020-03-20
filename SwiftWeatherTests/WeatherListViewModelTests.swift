//
//  WeatherListViewModelTests.swift
//  SwiftWeatherTests
//
//  Created by User on 2020/3/20.
//  Copyright © 2020 NTUB. All rights reserved.
//

import XCTest
@testable import swift_weather

class WeatherListViewModelTests: XCTestCase {

    private var weatherListVM: WeatherListViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        self.weatherListVM = WeatherListViewModel()
        
        self.weatherListVM.addWeatherViewModel(
            try! JSONDecoder().decode(WeatherViewModel.self, from: Data("""
                {
                    "name": "Taipei",
                    "main": {
                        "temp": 22,
                        "temp_min": 22,
                        "temp_max": 22
                    }
                }
            """.utf8))
        )
        
        self.weatherListVM.addWeatherViewModel(
            try! JSONDecoder().decode(WeatherViewModel.self, from: Data("""
                {
                    "name": "Kaohsiung",
                    "main": {
                        "temp": 23.87,
                        "temp_min": 23,
                        "temp_max": 24.44
                    }
                }
            """.utf8))
        )
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_should_be_able_to_convert_to_fahrenheit_successfully() {
        let fahrenheitTemperatures = [71.6, 74.97]
        self.weatherListVM.updateUnit(to: .fahrenheit)
        
        for (index, vm) in self.weatherListVM.weatherViewModels.enumerated() {
            XCTAssertEqual(round(vm.currentTemperature.temperature.value), round(fahrenheitTemperatures[index]))
        }
    }

}
