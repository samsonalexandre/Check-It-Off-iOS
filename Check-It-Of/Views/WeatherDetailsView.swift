//
//  WeatherDetailsView.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 29.02.24.
//

import SwiftUI

struct WeatherDetailsView: View {
    var weather: ResponseBody
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Text(weather.name)
                    .bold()
                    .font(.title)
                
                Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                    .fontWeight(.light)
                    .padding(.bottom)
                
                HStack {
                    VStack(spacing: 20) {
                        Image(systemName: "cloud")
                            .font(.system(size: 40))
                        
                        Text("\(weather.weather[0].main)")
                    }
                    .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                    
                    Text((weather.main.feelsLike.roundDouble()) + "°")
                        .font(.system(size: 100))
                        .fontWeight(.bold)
                        .padding()
                }
                .padding(.bottom)
            }
            .padding()
            AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .foregroundColor(.white)
            
            Spacer()
            
            VStack {
                HStack {
                    WeatherRow(logo: "thermometer", name: "Min temp", value: ((weather.main.tempMin.roundDouble()) + ("°")))
                    Spacer()
                    WeatherRow(logo: "thermometer", name: "Max temp", value: ((weather.main.tempMax.roundDouble()) + "°"))
                }
                
                HStack {
                    WeatherRow(logo: "wind", name: "Wind speed", value: ((weather.wind.speed.roundDouble()) + " m/s"))
                    Spacer()
                    WeatherRow(logo: "humidity", name: "Humidity", value: "\(String(describing: weather.main.humidity.roundDouble()))%")
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .offset(y: -20) // Offset to make space for the tabs below
        }
    }
}

#Preview {
    WeatherDetailsView(weather: previewWeather)
}
