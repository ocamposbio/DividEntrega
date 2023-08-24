//
//  LoginPage.swift
//  DiviDApp
//
//  Created by Student14 on 21/08/23.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    // mostrar tela de login
    @State var showMainPage: Bool = false
    var body: some View {
        
        VStack{
            Text("Bem\nvindo!")
                .font(.custom(CustomFont.latoBold, size: 55).bold())
                .foregroundColor(.white)
                .frame(maxWidth: .infinity,alignment: .leading)
                .frame(height: getRect().height / 3.5)
                .padding()
                .background(
                    ZStack{
                        // Círculo com Gradiente
                        LinearGradient(colors: [
                            Color("LoginCircle"),
                            Color("LoginCircle")
                                .opacity(0.8),
                            Color("Purple")
                        ], startPoint: .top, endPoint: .bottom)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .padding(.trailing)
                        .offset(y: -25)
                        .ignoresSafeArea()
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding(30)
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                            .frame(width: 23, height: 23)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(.leading,30)
                    }
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                // Form de página de login
                VStack(spacing: 15){
                    
                    Text(loginData.registerUser ? "Cadastrar" : "Entrar")
                        .font(.custom(CustomFont.latoBold, size: 22).bold())
                        .frame(maxWidth: .infinity,alignment: .leading)
                    
                    // Campo de texto customizado
                    
                    // ícone de email (envelope/carta)
                    CustomTextField(icon: "envelope", title: "Email", hint: "seuemail@gmail.com", value: $loginData.email, showPassword: .constant(false))
                        .padding(.top,30)
                    
                    // ícone da senha (cadeado)
                    CustomTextField(icon: "lock", title: "Senha", hint: "suasenha", value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top,10)
                    
                    // Registrar: confirmar senha
                    if loginData.registerUser{
                        CustomTextField(icon: "envelope", title: "Re-insira a senha", hint: "123456", value: $loginData.re_Enter_Password, showPassword: $loginData.showReEnterPassword)
                            .padding(.top,10)
                    }
                    
                    // Botão de senha esquecida
                    Button {
                        loginData.ForgotPassword()
                    } label: {
                        
                        Text("Esqueceu a senha?")
                            .font(.custom(CustomFont.latoBold, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Purple"))
                    }
                    .padding(.top,8)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    
                    // Botão de login
                    Button {
                        withAnimation{
                            showMainPage = true
                        }
                    } label: {
                        
                        Text("Entrar")
                            .font(.custom(CustomFont.latoBold, size: 17).bold())
                            .padding(.vertical,20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color("Purple"))
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                    }
                    .padding(.top,25)
                    .padding(.horizontal)
                    
                    // Botão para registrar usuário
                    
                    Button {
                        withAnimation{
                            loginData.registerUser.toggle()
                        }
                    } label: {
                        
                        Text(loginData.registerUser ? "Voltar para login" : "Criar conta")
                            .font(.custom(CustomFont.latoBold, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Purple"))
                    }
                    .padding(.top,8)
                }
                .padding(30)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(
                Color.white
                // Aplicando bordas customizados
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Purple"))
        .overlay(
            Group{
                if showMainPage{
                    MainPage()
                        .transition(.move(edge: .bottom))
                }
            }
        )
        // Limpando os dados após mudança
        // Opcional...
        .onChange(of: loginData.registerUser) { newValue in
            loginData.email = ""
            loginData.password = ""
            loginData.re_Enter_Password = ""
            loginData.showPassword = false
            loginData.showReEnterPassword = false
        }
    }
    
    @ViewBuilder
    func CustomTextField(icon: String,title: String,hint: String,value: Binding<String>,showPassword: Binding<Bool>)->some View{
        
        VStack(alignment: .leading, spacing: 12) {
            Label {
                Text(title)
                    .font(.custom(CustomFont.barlowCondensedSemiBold, size: 16))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Senha") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
                    .padding(.top,2)
            }
            else{
                TextField(hint, text: value)
                    .padding(.top,2)
            }
            Divider()
                .background(Color.black.opacity(0.4))
        }
        // Mostrando botão de mostrar senha
        .overlay(
            Group{
                if title.contains("Senha"){
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Esconder" : "Mostrar")
                            .font(.custom(CustomFont.latoBold, size: 13).bold())
                            .foregroundColor(Color("Purple"))
                    })
                    .offset(y: 8)
                }
            }
            ,alignment: .trailing
        )
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
