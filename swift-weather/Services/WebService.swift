//
//  WebService.swift
//  swift-weather
//
//  Created by User on 2020/3/16.
//  Copyright © 2020 NTUB. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class WebService {

    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }                
            } else {
                completion(nil)
            }
        }.resume()
    }

}
