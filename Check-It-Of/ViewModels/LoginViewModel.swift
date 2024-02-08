//
//  LoginViewModel.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 07.02.24.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
      
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Bitte füllen Sie alle Felder aus"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Bitte eine gültige Email eingeben"
            return false
        }
        return true
    }
}
