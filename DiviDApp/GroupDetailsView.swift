//
//  GroupDetailsView.swift
//  DiviDApp
//
//  Created by Student25 on 21/08/23.
//

import SwiftUI

struct GroupDetailsView: View {
    
    var group: Grupo
    
    var body: some View {
        
        VStack{
            VStack{
                Rectangle()
                    .frame(width: 400, height: 250)
                    .foregroundColor(.white)
                    .ignoresSafeArea()


                Spacer()
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
        .accentColor(Color.black)
        .background(Color.pink)
        .ignoresSafeArea()
    }
}

//struct GroupDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupDetailsView(
//            group: Grupo(nome: "Teste", integrantes: <#T##[Usuario]?#>, despesas: <#T##[Despesa]?#>, idade: Int?, cidade: <#T##String?#>, profileURL: <#T##String?#>)
//        )
//    }
//}
