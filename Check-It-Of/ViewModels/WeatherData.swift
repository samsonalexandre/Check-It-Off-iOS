//
//  WeatherData.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 27.02.24.
//

import Foundation

class WeatherData: ObservableObject {
    @Published var weather: ResponseBody? // Die Wetterdaten
    
    init(weather: ResponseBody? = nil) {
        self.weather = weather
    }
}
