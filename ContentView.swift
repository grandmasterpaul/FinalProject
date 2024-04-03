//
//  ContentView.swift
//  FinalProject
//
//  Created by Paul Stricker (student LM) on 3/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: Tabs = .opening
    
    var body: some View {
        VStack {
            
         Spacer()
    Text("Sunny Side Stories")
    .font(.custom("Helvetica", size: 40))
            .foregroundColor(.black)

   Image("picture1")
            Spacer()
    Image("quote1")
      Spacer()
       
            tab_bar(selectedTab: $selectedTab)
    
        
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
