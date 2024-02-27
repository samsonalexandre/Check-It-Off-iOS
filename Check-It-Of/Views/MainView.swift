//
//  ContentView.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 07.02.24.
//

import SwiftUI


struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.circle")
                }
            // WeatherView hinzugefügt
            WeatherView(weather: weatherViewModel.weatherData)
                .tabItem {
                    Label("Wetter", systemImage: "cloud.sun.fill")
                }
        }
    }
}

#Preview {
    MainView()
}
