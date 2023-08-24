//
//  OnBoardingPage.swift
//  DiviDApp
//
//  Created by Student14 on 21/08/23.
//

import SwiftUI

// fontes customizada
//let latoBold = "Lato-Bold"
//let barlowCondensedRegular = "BarlowCondensed-Regular"
//let BarlowCondensedSemiBold = "BarlowCondensed-SemiBold"

struct OnBoardingPage: View {
    // mostrar tela de login
    @State var showLoginPage: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
            Spacer()
            
            Button {
                withAnimation{
                    showLoginPage = true
                }
            } label: {
                
                Text("Começar")
                    .font(.custom(CustomFont.latoBold, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical,18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color("Purple"))
            }
            .padding(.horizontal,30)
            // Adicionando alguns ajustes para telas maiores...
            .offset(y: getRect().height < 750 ? 20 : 40)
            
            Spacer()
        }
        .padding()
        .padding(.top,getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Purple"))
        .overlay(
            Group{
                if showLoginPage{
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}

enum CustomFont {
    static let latoBold = "Lato-Bold"
    static let barlowCondensedRegular = "BarlowCondensed-Regular"
    static let barlowCondensedSemiBold = "BarlowCondensed-SemiBold"
}

