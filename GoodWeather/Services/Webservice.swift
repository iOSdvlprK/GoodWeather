//
//  Webservice.swift
//  GoodWeather
//
//  Created by joe on 3/24/24.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class Webservice {
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            print(data as Any)
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
