//
//  Retrieve.swift
//  DiviDApp
//
//  Created by Student21 on 23/08/23.
//

import SwiftUI

struct RetrieveView: View {
    @State private var usuario: [Usuario] = []
    private let usuarioManager = ViewModel()

    var body: some View {
        List(usuario, id: \.id) { item in
            Text(item.nome)
            Text(item.senha)
        }
//        .onAppear {
//            usuarioManager.fetchUsuarios { fetchUsuario in
//                usuario = fetchUsuario
//            }
//        }
    }
}

struct RetrieveView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
