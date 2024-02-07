//
//  LoginView.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 07.02.24.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView()
                //Login Form
                Form {
                    TextField("Email Adresse", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    SecureField("Passwort", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        //Log in
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            
                            Text("Anmelden")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                    .padding()
                }
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
