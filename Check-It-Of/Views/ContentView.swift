//
//  ContentView.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 29.02.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationViewModel()
    var weatherManager = WeatherViewModel()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Fehler beim Abrufen des Wetters: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
