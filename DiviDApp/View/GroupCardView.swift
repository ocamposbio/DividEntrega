//
//  GroupCardView.swift
//  DiviDApp
//
//  Created by Student14 on 23/08/23.
//

import SwiftUI

struct GroupCardView: View {
    // @Binding var grupo: Grupo
    var grupo: Grupo
    let cardColors: [Color] = [
        Color("PurpleLight"),
        Color("Red"),
        Color("Blue"),
        Color("Green"),
        Color("Yellow"),
        //Color("Orange")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(grupo.created_at)
                        .font(.caption)
                    Text(grupo.nome)
                        .font(.title2.bold())
                    Text("\(grupo.integrantes.count) Integrantes")
                        .font(.caption)
                }
                Spacer(minLength: 0)
            }
            .foregroundColor(textColor(for: randomCardColor()))
            
            HStack(spacing: -12){
                
                ForEach(1...3,id: \.self){index in
                    
                    Image("animoji\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .padding(4)
                        .background(.white,in: Circle())
                    // borda...
                        .background(Circle().stroke(.black,lineWidth: 1))
                }
                
                Spacer(minLength: 15)
                // Botao temporario
                Button {
                } label: {
                    Text("Entrar")
                        .foregroundColor(.black)
                        .padding(.horizontal,10)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.small)
                .tint(.white)
                .shadow(radius: 1.2)
            }
            .padding(.top,20)
        }
        .padding()
        .background(randomCardColor(), in: RoundedRectangle(cornerRadius: 10))
    }
    
    func randomCardColor() -> Color {
        let randomColor = cardColors.randomElement() ?? .black
        return randomColor
    }
    
    // determinar cor de texto apropriado baseado na cor de fundo
    func textColor(for backgroundColor: Color) -> Color {
        let backgroundColorComponents = UIColor(backgroundColor).cgColor.components ?? [0, 0, 0]
        let brightness = (0.299 * backgroundColorComponents[0] + 0.587 * backgroundColorComponents[1] + 0.114 * backgroundColorComponents[2])
        return brightness > 0.5 ? .black : .white
    }
}

//struct GroupCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Binding<Grupo> necessario para os dados
//        // fazer instancia de grupo para preview aqui
//        GroupCardView(grupo: .constant(Grupo()))
//    }
//}

