//
//  NovaDespesaView.swift
//  DiviDApp
//
//  Created by Student25 on 21/08/23.
//

import SwiftUI

struct MyVariables {
    static var selectedUsers: [FilterUsers] = [
        FilterUsers(user: Usuario(id: "1", nome: "Rodrigo Zamboni", email: "rodrigo@ufu.br", senha: "123", idade: 23), checked: false),
        FilterUsers(user: Usuario(id: "2", nome: "Otavio Augusto", email: "rodrigo@ufu.br", senha: "123", idade: 23), checked: false),
        FilterUsers(user: Usuario(id: "3", nome: "Guilherme Peres", email: "rodrigo@ufu.br", senha: "123", idade: 23), checked: false),
        FilterUsers(user: Usuario(id: "4", nome: "Igor Augusto", email: "rodrigo@ufu.br", senha: "123", idade: 23), checked: false),
        FilterUsers(user: Usuario(id: "5", nome: "Joao Pedro", email: "rodrigo@ufu.br", senha: "123", idade: 23), checked: false),
        FilterUsers(user: Usuario(id: "6", nome: "Edilson", email: "rodrigo@ufu.br", senha: "123", idade: 23), checked: false),
        FilterUsers(user: Usuario(id: "7", nome: "Gabriel Thomaz", email: "rodrigo@ufu.br", senha: "123", idade: 23), checked: false)
        ]
}

struct FilterUsers: Hashable {
    var user: Usuario
    var checked: Bool
}


struct NovaDespesaView: View {
    @State var nomeDespesa = ""
    @State var valorDespesa = ""
    @State var contador = 0
    var body: some View {
        
        NavigationStack{
            
            VStack{
                VStack{
                    
                    VStack{
                        Text("NOVA DESPESA")
                            .font(.system(size: 32, weight: .bold))
                            .padding()
                        
                        TextField("Nome", text: $nomeDespesa)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 40)
                            .background( Color("inputBG"))
                            .cornerRadius(5)
                            .padding()
                        
                        TextField("Valor", text: $valorDespesa)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 40)
                            .background( Color("inputBG"))
                            .cornerRadius(5)
                    }
                    
                    VStack{
                        Text("PARTICIPANTES")
                            .font(.system(size: 32, weight: .bold))
                            .padding()
                        Text("\(contador)/\(MyVariables.selectedUsers.count)")
                        
                    }
                    
                    
                    VStack{
                        
                        ScrollView(.vertical){
                            ForEach(Array(MyVariables.selectedUsers.enumerated()), id: \.offset) { index, integrante in
                                
                                
                                
                                HStack{
                                    Text(integrante.user.nome)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    
                                    ZStack{
                                        Circle()
                                            .stroke( MyVariables.selectedUsers[index].checked ? Color("green") : Color.gray, lineWidth: 1)
                                            .frame(width: 25, height: 25)
                                        
                                        
                                        if MyVariables.selectedUsers[index].checked {
                                            Image(systemName: "checkmark.circle.fill")
                                                .font(.system(size: 25))
                                                .foregroundColor(.green)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    MyVariables.selectedUsers[index].checked.toggle()
                                    if MyVariables.selectedUsers[index].checked{
                                        contador = contador + 1
                                    }else {
                                        contador = contador - 1
                                    }
                                        print(MyVariables.selectedUsers[index])
                                        print(MyVariables.selectedUsers[index].checked)
                                    }
                                
                                
                                   
                            }
                        }
                        
                        
                    }
                    
                    Spacer()
                    Button("Criar"){
                        print(MyVariables.selectedUsers)
                        // aqui iremos fazer a requisicao de criacao de uma nova despesa
                    }
                    .frame(width: 150, height: 50)
                    .padding()
                    .background(Color("GalaxyBlue"))
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(14)

                    
                    
                    Spacer()
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
            .accentColor(Color.black)
            .background(Color.white)
            
        }

        
    }
}



struct NovaDespesaView_Previews: PreviewProvider {

    static var previews: some View {
        NovaDespesaView()
    }
}
