//
//  Dynamic.swift
//  swift-weather
//
//  Created by User on 2020/3/20.
//  Copyright © 2020 NTUB. All rights reserved.
//

import Foundation

class Dynamic<T>: Decodable where T: Decodable {

    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(value)
    }
    
    private enum CodingKeys: CodingKey {
        case value
    }

}
