//
//  LoginView.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 07.02.24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vieweModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "Check-It-Of", subtitle: "Aufgaben zu ende bringen", angle: 15, background: .pink)
                
                Form {
                    
                    if !vieweModel.errorMessage.isEmpty {
                        Text(vieweModel.errorMessage)
                    }
                    
                    TextField("Email Adresse", text: $vieweModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Passwort", text: $vieweModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    ToDoButton(title: "Anmelden", background: .blue) {
                        vieweModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                //Create Account
                VStack {
                    Text("Neu hier?")
                    
                    NavigationLink("Erstellen Sie ein Konto", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
