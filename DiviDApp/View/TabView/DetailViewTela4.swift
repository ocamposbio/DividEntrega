import SwiftUI
struct DetailViewTela4: View {
    var grupo: Grupo
    @StateObject var viewModel = ViewModel()
    
    func calculaParicipantes(id: String) -> String{
        var divs = 0
        var pagos = 0
        
        
        for divida in viewModel.dividas {
            
            if(divida.despesaID == id) {
                divs = divs + 1
                if(divida.status){
                    pagos = pagos + 1
                }
            }
        }
        
        return "\(pagos)/\(divs)"
        
    }
    
    var body: some View {
        
        NavigationStack{
            VStack{
                HStack {
                    Spacer()
                    Text(grupo.nome)
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .padding()
                    Label("", systemImage: "gearshape.fill").font(.system(size: 40))
                }
                HStack {
                    Label("\(grupo.integrantes.count)", systemImage: "person.crop.circle.fill").font(.system(size: 35))
                    
                    Label("", systemImage: "cart.badge.questionmark").font(.system(size: 80))
                    Text("\(grupo.created_at)").font(.system(size: 20))
                } // Layout de cima
                
                
                ScrollView{
                    VStack{
                        ForEach( viewModel.despesas ){ desp in
                            if( grupo.despesas.contains(desp.id)){
                                NavigationLink(destination: DetailViewTela6(grupo: grupo, despesa: desp)) {
                                    
                                    VStack{
                                        
                                        Text(desp.nome).font(.system(size: 30))
                                        HStack{
                                            Text(calculaParicipantes(id:desp.id))
                                            Spacer()
                                            Text(desp.created_at)
                                        }
                                    }
                                }
                            }
                        }.frame(width: 300, height: 150).foregroundColor(.black).background{Color.gray}.cornerRadius(25) //Fim ForEach
                    }//Fim VStack
                } //Fim ScrollView
            }//Fim VStack Principal
        }//Fim Navigation Stack
        .onAppear(){
            viewModel.fetchDespesas()
            viewModel.fetchDividas()
        } // Fim onAppear
    }
}
struct DetailViewTela4_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewTela4( grupo: Grupo( id: "1",nome: "Grupo X", integrantes: ["1","2","3"], despesas: ["1","2","3"], created_at: "12/09/2022") )
    }
}


