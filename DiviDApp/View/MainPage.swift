//
//  MainPage.swift
//  DiviDApp
//
//  Created by Student14 on 22/08/23.
//

import SwiftUI

struct MainPage: View {
    // Tab atual
    @State var currentTab: Tab = .Home
    
    // Escondendo tab
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        VStack(spacing: 0){

            // Tab View...
            TabView(selection: $currentTab) {
                Home()
                    .tag(Tab.Home)
                NewGroupPage(nomeNovosParticipante:[])
                    .tag(Tab.Add)
                 ProfilePage()
                    .tag(Tab.Profile)
            }
            
            // Tab bar personalizada
            HStack(spacing: 0){
                ForEach(Tab.allCases,id: \.self){tab in
                    
                    Button {
                        // Atualizando tab
                        currentTab = tab
                    } label: {
                        Image(systemName: tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                        // Aplicando pequena sombra no fundo
                            .background(
                                Color("Purple")
                                    .opacity(0.1)
                                    .cornerRadius(5)
                                // Borrando
                                    .blur(radius: 5)
                                // Aumentando
                                    .padding(-7)
                                    .opacity(currentTab == tab ? 1 : 0)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color("Purple") : Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal,.top])
            .padding(.bottom,10)
        }
        .background(Color("HomeBG").ignoresSafeArea())
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

// Cases iteraveis
// Casos (cases) de tabs
enum Tab: String, CaseIterable{
    // Valor raw deve ser o mesmo que os nomes nos assets (nesse caso
    case Home = "house"
    case Add = "plus"
    case Profile = "person"
}
