//
//  HomeView.swift
//  FinalProject
//
//  Created by Nolan Walters (student LM) on 4/1/24.
//

import SwiftUI



struct HomeView: View {
    
    let holder: String
    
    init() {
        let num = Int.random(in: 1...4) // Generate a random number between 1 and 4
        switch num {
        case 1:
            holder = "quote1"
        case 2:
            holder = "quote2"
        case 3:
            holder = "quote3"
        case 4:
            holder = "quote4"
        default:
            holder = ""
        }
    }
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                NavigationLink(destination: ContentView()) {
                    
                    VStack{
                        
                        Text("ONLYGOODNEWS")
                            .font(Constants.textFont)
                            .foregroundColor(.black)
                        
                        
                        Image(holder)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text("Welcome!")
                            .font(Constants.textFont)
                            .foregroundColor(.black)
                            .background(.white)
                        
                        
                    }
                    
                    
                }
                
                
            }
            
            
        }
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
