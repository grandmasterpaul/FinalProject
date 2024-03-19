//
//  ContentView.swift
//  FinalProject
//
//  Created by Paul Stricker (student LM) on 3/8/24.
//



//fix jaydns tab bar/make it work

import SwiftUI

enum ShowView{
    case open, home
}

struct ContentView: View {
    
    @State var showView: ShowView = .open
    
    
    var body: some View {
        VStack {
            
            if showView == .open{
                ArticleView()
            }
            
            else if showView == .home{
                HomeView()
            }
            
            
            Spacer()
            
            HStack{
                
                Button {
                    showView = .home
                }label: {
                    Text("Opening")
                    Image(systemName: "house")
                    
                }
                
                Button {
                    showView = .open
                }label: {
                    Text("Articles")
                    Image(systemName: "book")
                    
                }
            }
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
