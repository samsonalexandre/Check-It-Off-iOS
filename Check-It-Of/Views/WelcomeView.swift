//
//  WelcomeView.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 29.02.24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Willkommen bei der Wetter-App")
                    .bold()
                    .font(.title)
                
                Text("Bitte teilen Sie Ihren aktuellen Standort mit, um das Wetter in Ihrer Region zu erhalten")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()

            
            // LocationButton from CoreLocationUI framework imported above, allows us to requestionLocation
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
