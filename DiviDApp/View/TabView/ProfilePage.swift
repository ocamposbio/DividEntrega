//
//  ProfilePage.swift
//  DiviDApp
//
//  Created by Student14 on 22/08/23.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    Text("Meu Perfil")
                        .font(.custom(CustomFont.barlowCondensedSemiBold, size: 28).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 15){
                        Image("Profile_Image")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .offset(y: -30)
                            .padding(.bottom,-30)
                        
                        Text("Rosa Parks")
                            .font(.custom(CustomFont.barlowCondensedSemiBold, size: 16))
                            .fontWeight(.semibold)
                        
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: "location.north.circle.fill")
                                .foregroundColor(.gray)
                                .rotationEffect(.init(degrees: 180))
                            
                            Text("Endereço: 1B Santa Mônica\nUFU\nUberlândia, MG")
                                .font(.custom(CustomFont.barlowCondensedSemiBold, size: 15))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.horizontal,.bottom])
                    .background(
                        Color.white
                            .cornerRadius(12)
                    )
                    .padding()
                    .padding(.top,40)
                    
                    // Navigation Links personalizados
                    
                    CustomNavigationLink(title: "Editar perfil") {
                        Text("")
                            .navigationTitle("Editar perfil")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("HomeBG").ignoresSafeArea())
                    }
                    
                    
                    CustomNavigationLink(title: "Endereço de cobrança") {
                        Text("")
                            .navigationTitle("Endereço de cobrança")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("HomeBG").ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(title: "Histórico de Pagamentos") {
                        Text("")
                            .navigationTitle("Histórico de Pagamentos")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("HomeBG").ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(title: "Privacidade") {
                        Text("")
                            .navigationTitle("Privacidade")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("HomeBG").ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(title: "Ajustes") {
                        Text("")
                            .navigationTitle("Ajustes")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("HomeBG").ignoresSafeArea())
                    }
                }
                .padding(.horizontal,22)
                .padding(.vertical,20)
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color("HomeBG")
                    .ignoresSafeArea()
            )
        }.tint(.black)
    }
    
    // Evitando novas structs
    @ViewBuilder
    func CustomNavigationLink<Detail: View>(title: String,@ViewBuilder content: @escaping ()->Detail)->some View{
        
        NavigationLink {
            content()
        } label: {
            HStack{
                Text(title)
                    .font(.custom(CustomFont.barlowCondensedRegular, size: 17))
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
            .background(Color.white.cornerRadius(12))
            .padding(.horizontal)
            .padding(.top,10)
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
