//
//  WeatherManager.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 26.02.24.
//

import Foundation
import CoreLocation
import Combine

// Manager-Klasse für Wetterabruf
class WeatherManager {
    private let apiKey = "d05d140071e6bfee973ba935949bed53"
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) -> AnyPublisher<ResponseBody, Error> {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric") else {
            fatalError("Missing URL")
        }

        let urlRequest = URLRequest(url: url)

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map { $0.data }
            .decode(type: ResponseBody.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

// Model für Wetterdaten
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
