//
//  ProfileView.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 07.02.24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Profil")
        }
    }
}

#Preview {
    ProfileView()
}
