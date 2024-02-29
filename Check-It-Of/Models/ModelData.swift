//
//  ModelData.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 26.02.24.
//

import Foundation

var previewWeather: ResponseBody = load("weatherData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Wurde nicht \(filename) im Hauptpaket gefunden.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Konnte nicht geladen werden \(filename) aus dem Hauptpaket:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Konnte nicht analysiert werden \(filename) as \(T.self):\n\(error)")
    }
}
