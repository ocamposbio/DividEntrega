//
//  ContentView.swift
//  DiviDApp
//
//  Created by Student25 on 18/08/23.
//

import SwiftUI

struct ContentView: View {
    // Log Status..
    //@AppStorage("log_Status") var log_Status: Bool = false
    var body: some View {
//        Group{
//            if log_Status{
//                MainPage()
//            }
//            else{
//                OnBoardingPage()
//            }
//        }
        OnBoardingPage()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
