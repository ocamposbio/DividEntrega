
import SwiftUI
import Foundation

class ViewModel: ObservableObject {
    
    @Published var usuarios: [Usuario] = []
    @Published var grupos: [Grupo] = []
    @Published var despesas: [Despesa] = []
    @Published var dividas: [Divida] = []
    
    // GET USUARIOS
    func fetchUsuarios(){
        guard let url = URL(string: "http://192.168.128.245:1880/dividusuarios") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Usuario].self, from: data)
                
                DispatchQueue.main.async {
                    self?.usuarios = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    // GET GRUPOS
    func fetchGrupos(){
        guard let url = URL(string: "http://192.168.128.245:1880/dividgrupos") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Grupo].self, from: data)
                
                DispatchQueue.main.async {
                    self?.grupos = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    // GET DESPESAS
    func fetchDespesas(){
        guard let url = URL(string: "http://192.168.128.245:1880/dividdespesas") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Despesa].self, from: data)
                
                DispatchQueue.main.async {
                    self?.despesas = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    // GET DIVIDAS
    func fetchDividas(){
        guard let url = URL(string: "http://192.168.128.245:1880/dividdividas") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Divida].self, from: data)
                
                DispatchQueue.main.async {
                    self?.dividas = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    
    func createGrupo(data: Grupo ) {//tipo de objeto exemplo [Objeto]
      

      
      // create the url with URL
      let url = URL(string: "http://192.168.128.245:1880/dividgrupos")!
      
      let session = URLSession.shared
      
      var request = URLRequest(url: url)
      request.httpMethod = "POST" //colocar o metodo de request http como POST

      request.addValue("application/json", forHTTPHeaderField: "Content-Type")
      request.addValue("application/json", forHTTPHeaderField: "Accept")
      
      do {
          //try JSONEncoder().encode(parameters)
          request.httpBody = try JSONEncoder().encode(data)
      } catch{
          print(error)
      }
      
      let task = session.dataTask(with: request) { data, response, error in
        
        if let error = error {
          print("Post Request Error: \(error.localizedDescription)")
          return
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)
        else {
          print("Reposta invalida recebida do servidor")
          return
        }
        
        guard let responseData = data else {
          print("data nulo recebida do servidor")
          return
        }
        
        do {

          if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
            print(jsonResponse)
          } else {
            print("o dado pode estar corrompido ou estar no formato diferente do esperado")
            throw URLError(.badServerResponse)
          }
        } catch let error {
          print(error.localizedDescription)
        }
      }
      task.resume()
    }
    
    func createDespesa(data: Despesa ) {//tipo de objeto exemplo [Objeto]
      

      
      // create the url with URL
      let url = URL(string: "http://192.168.128.245:1880/dividdespesas")!
      
      let session = URLSession.shared
      
      var request = URLRequest(url: url)
      request.httpMethod = "POST" //colocar o metodo de request http como POST

      request.addValue("application/json", forHTTPHeaderField: "Content-Type")
      request.addValue("application/json", forHTTPHeaderField: "Accept")
      
      do {
          //try JSONEncoder().encode(parameters)
          request.httpBody = try JSONEncoder().encode(data)
      } catch{
          print(error)
      }
      
      let task = session.dataTask(with: request) { data, response, error in
        
        if let error = error {
          print("Post Request Error: \(error.localizedDescription)")
          return
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)
        else {
          print("Reposta invalida recebida do servidor")
          return
        }
        
        guard let responseData = data else {
          print("data nulo recebida do servidor")
          return
        }
        
        do {

          if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
            print(jsonResponse)
          } else {
            print("o dado pode estar corrompido ou estar no formato diferente do esperado")
            throw URLError(.badServerResponse)
          }
        } catch let error {
          print(error.localizedDescription)
        }
      }
      task.resume()
    }
    
    func createDividas(data: [Divida] ) {//tipo de objeto exemplo [Objeto]
      

      
      // create the url with URL
      let url = URL(string: "http://192.168.128.245:1880/dividdividas")!
      
      let session = URLSession.shared
      
      var request = URLRequest(url: url)
      request.httpMethod = "POST" //colocar o metodo de request http como POST

      request.addValue("application/json", forHTTPHeaderField: "Content-Type")
      request.addValue("application/json", forHTTPHeaderField: "Accept")
      
      do {
          //try JSONEncoder().encode(parameters)
          request.httpBody = try JSONEncoder().encode(data)
      } catch{
          print(error)
      }
      
      let task = session.dataTask(with: request) { data, response, error in
        
        if let error = error {
          print("Post Request Error: \(error.localizedDescription)")
          return
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)
        else {
          print("Reposta invalida recebida do servidor")
          return
        }
        
        guard let responseData = data else {
          print("data nulo recebida do servidor")
          return
        }
        
        do {

          if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
            print(jsonResponse)
          } else {
            print("o dado pode estar corrompido ou estar no formato diferente do esperado")
            throw URLError(.badServerResponse)
          }
        } catch let error {
          print(error.localizedDescription)
        }
      }
      task.resume()
    }

}
