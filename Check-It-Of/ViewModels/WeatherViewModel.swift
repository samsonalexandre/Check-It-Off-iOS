//
//  WeatherViewModel.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 27.02.24.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var weatherData: ResponseBody?
    private let locationManager = LocationManager()
    private let weatherManager = WeatherManager()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        locationManager.$location
            .compactMap { $0?.coordinate }
            .sink { [weak self] coordinates in
                self?.fetchWeather(latitude: coordinates.latitude, longitude: coordinates.longitude)
            }
            .store(in: &cancellables)
        
        locationManager.requestLocation()
    }
    
    func fetchWeather(latitude: Double, longitude: Double) {
        weatherManager.getCurrentWeather(latitude: latitude, longitude: longitude)
            .sink { completion in
                            // Handle completion if needed
                        } receiveValue: { weather in
                            self.weatherData = weather
                        }
            .store(in: &cancellables)
    }
}
