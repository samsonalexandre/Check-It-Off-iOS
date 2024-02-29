//
//  WeatherViewModel.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 27.02.24.
//

import SwiftUI
import Combine
import CoreLocationUI

/*
class WeatherViewModel: ObservableObject {
    let weatherManager = WeatherManager()
    @Published var weather: ResponseBody?
    var cancellable: AnyCancellable?
    @ObservedObject var locationManager = LocationManager()
    
    func fetchWeather() {
        guard let location = locationManager.location else { return }
        cancellable = weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { response in
                    self.weather = response
                  })
    }
}
*/
