//
//  ContentView.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 07.02.24.
//

import SwiftUI


struct MainView: View {
    @StateObject var viewModel = MainViewModel()
        
        var body: some View {
            TabView {
                if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                    ToDoListView(userId: viewModel.currentUserId)
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                } else {
                    LoginView()
                        .tabItem {
                            Label("Anmelden", systemImage: "person.fill")
                        }
                }
                
                ProfileView()
                    .tabItem {
                        Label("Profil", systemImage: "person.circle")
                    }
                
                ContentView()
                    .tabItem {
                        Label("Wetter", systemImage: "cloud.sun.fill")
                    }
            }
            .accentColor(.blue) // Wählen Sie die Akzentfarbe für die Registerkarten
        }
}

#Preview {
    MainView()
}
