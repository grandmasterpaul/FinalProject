//
//  ContentView.swift
//  FinalProject
//
//  Created by Paul Stricker (student LM) on 3/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
         Spacer()
    Text("Sunny Side Stories")
    .font(.custom("Helvetica", size: 40))
            .foregroundColor(.black)
            
    Color("background")
            .ignoresSafeArea(.all)
            
   Image("picture1")
            Spacer()
    Image("quote1")
      Spacer()
       
    
        
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//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
