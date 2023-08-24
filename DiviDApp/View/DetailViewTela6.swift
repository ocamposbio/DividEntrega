
//  DetailViewTela6.swift
//  Projeto
//
//  Created by Student10 on 21/08/23.
//

import SwiftUI

struct DetailViewTela6: View {
    
    @State private var atualizarPressed = false
    @State private var checkedMembers: Set<String> = [] // Para rastrear os integrantes selecionados
    var despesa: Despesa
    @StateObject var viewModel = ViewModel()
    
    
    var body: some View {
        Text("oi")
        
    }
}

struct DetailViewTela6_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewTela6( despesa: Despesa(id: "1", nome: "coca cola", donoID: "1", created_at: "Hoje") )
    }
}
