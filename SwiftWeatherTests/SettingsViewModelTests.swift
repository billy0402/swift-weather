//
//  SettingsViewModelTests.swift
//  SwiftWeatherTests
//
//  Created by User on 2020/3/20.
//  Copyright © 2020 NTUB. All rights reserved.
//

import XCTest
@testable import swift_weather

class SettingsViewModelTests: XCTestCase {

    private var settingsVM: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        
        self.settingsVM = SettingsViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }
    
    func test_should_make_sure_that_default_selected_unit_is_celsius() {
        XCTAssertEqual(settingsVM.selectedUnit, .celsius)
    }
    
    func test_should_return_correct_display_name_for_celsius() {
        XCTAssertEqual(settingsVM.selectedUnit.displayName, "Celsius")
    }
    
    func test_should_be_able_to_save_user_unit_selection() {
        self.settingsVM.selectedUnit = .fahrenheit
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }

}
