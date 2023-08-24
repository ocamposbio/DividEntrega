//
//  Home.swift
//  DiviDApp
//
//  Created by Student14 on 22/08/23.
//

import SwiftUI

struct Home: View {
    
    @Namespace var animationID
    @State var currentTab = "Recentes"
    
    @StateObject var homeModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15){
                    
                    Text("**Grupos**")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(alignment: .bottom){
            
                        Text("Olá, Usuário!")
                        //Text("Olá, \(homeModel.usuarios)!")
                            .font(.title3)
                        // Espaçamento da letra
                            .kerning(1.1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.top,8)
                    
                    // TabView segmentada
                    HStack(spacing: 0){
                        
                        // simplesmente criando um array de tabs e o percorrendo
                        ForEach(["Recentes","Em atraso","Parciais","Pagas"],id: \.self){tab in
                            
                            TabButton(currentTab: $currentTab, title: tab, animationID: animationID)
                        }
                    }
                    .padding(.top,25)
                    
                    if homeModel.grupos.isEmpty{
                        Image("notes")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .padding(.top,40)
                        
                        Text("Criar **Grupo**")
                            .font(.title2)
                            .padding(.top)
                    }
                    
                    ForEach(homeModel.grupos) { grupo in
                        NavigationLink(destination: DetailViewTela4(grupo: grupo)) {
                            GroupCardView(grupo: grupo)
                                .padding(.vertical, 10)
                        }
                    }
                }
                .padding()
            }
            .background(Color("Bg"))
            .onAppear(){
                homeModel.fetchGrupos()
            }
        }

    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}

struct TabButton: View{
    @Binding var currentTab: String
    var title: String
    // para o indicador animado
    var animationID: Namespace.ID
    
    var body: some View{
        
        Button {
            
            withAnimation(.spring()){
                currentTab = title
            }
            
        } label: {
            
            VStack{
                
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(currentTab == title ? .black : .gray)
                
                if currentTab == title{
                    Rectangle()
                        .fill(.black)
                        .matchedGeometryEffect(id: "TAB", in: animationID)
                        .frame(width: 50, height: 1)
                }
                else{
                    Rectangle()
                        .fill(.clear)
                        .frame(width: 50, height: 1)
                }
            }
            // Taking Available Width...
            .frame(maxWidth: .infinity)
        }
        
    }
}
