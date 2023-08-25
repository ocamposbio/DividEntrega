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
    
    var grupo: Grupo
    @State var nomeDespesa = ""
    @State var valorDespesa = ""
    @State var contador = 0
    @StateObject var viewModel = ViewModel()
    
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
                            .background( Color("HomeBG"))
                            .cornerRadius(5)
                            .padding()
                        
                        TextField("Valor", text: $valorDespesa)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 40)
                            .background( Color("HomeBG"))
                            .cornerRadius(5)
                    }
                    
                    VStack{
                        Text("PARTICIPANTES")
                            .font(.system(size: 32, weight: .bold))
                            .padding()
                        Text("\(contador)/\(MyVariables.selectedUsers.count)")
                        
                    }
                    
                    
                    VStack{
                        
                        ScrollView{
                            ForEach(Array(MyVariables.selectedUsers.enumerated()), id: \.offset) { index, integrante in
                                
                                
                                
                                HStack{
                                    Text(integrante.user.nome)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                    HStack{
                                        Spacer()
                                        
                                        
                                        Circle()
                                            .stroke( MyVariables.selectedUsers[index].checked ? Color("green") : Color.gray, lineWidth: 1)
                                            .frame(width: 25, height: 25)
                                            //.offset(y: CGFloat(40 * index))
                                        
                                        
                                        if MyVariables.selectedUsers[index].checked {
                                            Image(systemName: "checkmark.circle.fill")
                                                .font(.system(size: 25))
                                                .foregroundColor(.green)
                                        }
                                        
                                    }
                                }.offset(y: CGFloat(40 * index))
                                .padding(.horizontal)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    MyVariables.selectedUsers[index].checked.toggle()
                                    if MyVariables.selectedUsers[index].checked{
                                        contador = contador + 1
                                    }else {
                                        contador = contador - 1
                                    }
                                }
                                
                                
                                   
                            }
                        }
                        
                        
                    }
                    
                    Spacer()
                    Button("Criar"){
                        let despID = String(Int.random(in: 1...10000))
                        
                        var dividasToCreate:[Divida] = []
                        var qntCaloteiros = 0
                        for usu in MyVariables.selectedUsers{
                            if usu.checked{
                                qntCaloteiros = qntCaloteiros + 1
                            }
                        }
                        
                        let a:Double = Double(valorDespesa)!
                        let b:Double = Double(qntCaloteiros)
                        let valorDividido:Double = a / b
                        
                        print(valorDividido)
                        
                        let despesaToCreate: Despesa = Despesa(id: despID, nome: nomeDespesa, donoID: "1", created_at: "25/08")
                        
                        for usu in MyVariables.selectedUsers{
                            if(usu.checked){
                                dividasToCreate.append(Divida(id: String(Int.random(in: 1...10000)), userID: usu.user.id, despesaID: despID, valor: valorDividido, status: false))
                            }
                            
                        }
//                        print(despesaToCreate)
//                        print(dividasToCreate)
                        
                        //criar nova despesa e suas dividas
//                        viewModel.createDespesa(data: despesaToCreate)
//                        viewModel.createDividas(data: dividasToCreate)
//                        
                        // adicionar a nova despesa no array de despesas di grupo
                        let aux = grupo.despesas
                        
                        let novoGrupo = Grupo(_id: grupo._id, _rev: grupo._rev, nome: grupo.nome, integrantes: grupo.integrantes, despesas: aux, created_at: grupo.created_at)
                        
//                        viewModel.attDespesasGrupo(data: novoGrupo)
                        // aqui iremos fazer a requisicao de criacao de uma nova despesa
                    }
                    .frame(width: 150, height: 50)
                    .padding()
                    .background(Color("Purple"))
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
        NovaDespesaView( grupo: Grupo(_id:"1",_rev:"1", nome: "Grupo 1", integrantes: ["1","2","3"], despesas: ["1","2"], created_at: "24/08"))
    }
}
