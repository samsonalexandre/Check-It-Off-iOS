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
class WeatherViewModel {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {

        let apiKey = "d05d140071e6bfee973ba935949bed53"
        let lang = "de"
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric&lang=\(lang)") else {
            fatalError("Missing URL")
        }

        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Fehler beim Abrufen von Daten") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

