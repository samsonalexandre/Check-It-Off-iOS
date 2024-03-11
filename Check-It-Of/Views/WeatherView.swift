//
//  APIView.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 16.02.24.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer() // Platziert den Inhalt oben und gibt Platz für die Tabs
                
                // Hier bleibt der restliche Inhalt des WeatherViews
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            
                            Text("\(weather.weather[0].main)")
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height:  100)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer() // Platziert den Tab-Bar unten
                VStack(alignment: .leading, spacing: 20) {
                    Text("Wetter")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRowView(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + ("°")))
                        Spacer()
                        WeatherRowView(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRowView(logo: "wind", name: "Windgeschwindigkeit", value: (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRowView(logo: "humidity", name: "Luftfeuchtigkeit", value: "\(weather.main.humidity.roundDouble())%")
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                .offset(y: -88)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}


