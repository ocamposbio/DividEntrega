//
//  LoginPageModel.swift
//  DiviDApp
//
//  Created by Student14 on 21/08/23.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    
    // Propriedades de login
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    // Propriedades de Registro
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    
    // Status de log
    //@AppStorage("log_Status") var log_Status: Bool = false
    
    // Chamada de login
    func Login(){
//        // Fazer acao aqui
//        withAnimation{
//            log_Status = true
//        }
    }
    
    func Register(){
//        // Fazer acao aqui
//        withAnimation{
//            log_Status = true
//        }
    }
    
    func ForgotPassword(){
        
    }
}
