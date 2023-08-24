//
//  APIModels.swift
//  DiviDApp
//
//  Created by Student25 on 21/08/23.
//

import Foundation

struct Usuario: Codable, Hashable, Identifiable{
    let id: String
    let nome: String
    let email: String
    let senha: String
    let idade: Int
}

struct Divida: Codable, Hashable, Identifiable{
    let id: String
    let userID: String
    let despesaID: String
    let valor: Double
    let status: Bool
}

struct Despesa: Codable, Hashable, Identifiable{
    let id: String
    let nome: String
    let donoID: String
    let created_at: String
}

struct Grupo: Codable, Hashable, Identifiable{
    let id: String
    let nome: String
    let integrantes: [String]
    let despesas: [String]
    let created_at: String
}
