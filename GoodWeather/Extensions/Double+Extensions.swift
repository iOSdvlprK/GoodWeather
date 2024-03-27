//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by joe on 3/27/24.
//

import Foundation

extension Double {
    var formatAsDegree: String {
        return String(format: "%.0f°C", self)
    }
}
