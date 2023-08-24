//
//  DetailViewTela6.swift
//  Projeto
//
//  Created by Student10 on 21/08/23.
//
import SwiftUI
struct DetailViewTela6: View {
    @State var grupo : Grupo
    @State private var atualizarPressed = false
    @State private var checkedMembers: Set<String> = [] // Para rastrear os integrantes selecionados
    var despesa: Despesa
    @StateObject var viewModel = ViewModel()
    
    @State  var despDividas: [Divida] = []
    
    
    var body: some View {
        VStack{
            Text(despesa.nome).font(.system(size: 50))
                .multilineTextAlignment(.center)
            
            Spacer()
            
            ForEach(viewModel.usuarios) { usu in
                
                if(usu.id == despesa.donoID){
                    Text(usu.nome)
                        .font(.system(size: 25))
                        .multilineTextAlignment(.center)
                    Text("feito por")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                }
            }
            
            Spacer()
            
            Text("Participantes:").font(.system(size: 30))
            //Text(despesa.donoID)
            
            // Caloteiros
            ScrollView(.vertical){
                VStack{
                    ForEach(viewModel.dividas){
                        divida in
                        VStack{
                            ForEach(viewModel.usuarios, id: \.self) { usu in
                                
                                if ( divida.despesaID == despesa.id && usu.id == divida.userID){
                                    
                                    HStack{
                                        HStack{
                                            VStack{
                                                HStack{
                                                    
                                                    Text(usu.nome)
                                                        .padding()
                                                    Spacer()
                                                    if (divida.status){
                                                        Image(systemName: "checkmark.seal.fill")
                                                            .foregroundColor(.green)
                                                            .padding()
                                                    } else {
                                                        Text("R$\( divida.valor, specifier: "%.2f")")
                                                            .padding()
                                                    }
                                                    
                                                }
                                            }
                                        }
                                    }
                                    
                                }
                                
                                
                            }
                        }
                        .padding(10)
                        
                        VStack{
                            
                            
                        }//FIM HStack
                    }//FIM Foreach
                }
            }
            .frame(width: 300, height: 250).foregroundColor(.black).background{Color.gray}.cornerRadius(25)
            
            
            Spacer()
            
            Button("Atualizar"){
                atualizarPressed = true
            }.padding(.horizontal) //Fim Botao
            Spacer()
            
        }.onAppear() { //FIM VStack
            viewModel.fetchDividas()
            viewModel.fetchUsuarios()
            
            
            for divs in viewModel.dividas{
                if(divs.despesaID == despesa.id){
                    despDividas.append(divs)
                }
            }
        }//FIM OnAppear
    }
}


//struct DetailViewTela6_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailViewTela6( despesa: Despesa(id: "1", nome: "coca cola", donoID: "1", created_at: "Hoje") )
//    }
//}


