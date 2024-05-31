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
                    
                    
                 
            
                 
                    VStack (alignment: .center, spacing: 4){
                     
                        
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFit()
                            .frame(width:24, height: 24)
                            .foregroundColor(.red)
                        
                        Text("Opening")
                            .foregroundColor(.red)
                        
                        GeometryReader{geo in
                            
                            if showView == .home{
                                
                                Rectangle()
                                
                                    .foregroundColor(.red)
                                
                                    .frame(width: geo.size.width/2, height: 4)
                                
                                    .padding(.leading, geo.size.width/4)
                            }
                            
                            
                        }
                        .frame(height: -2.0)
                        
                        
                    }
                    
                    Button {
                        showView = .open
                    }label: {
                        
                        
                        VStack (alignment: .center, spacing: 4){
                            
                            Image(systemName: "bubble.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width:24, height: 24)
                                .foregroundColor(.red)
                            
                            Text("Articles")
                                .foregroundColor(.red)
                             
                            
                            GeometryReader{geo in
                                
                                if showView == .open{
                                    
                                    Rectangle()
                                
                   
                       
                                        .foregroundColor(.red)
                                        .frame(width: geo.size.width/2, height: 4)
                                    
                                        .padding(.leading, geo.size.width/4)
                                }
                               
                            }
                         //makes tab bar stay at bottom
                            .frame(height: -2.0)
                            
                        }
                        
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    //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
}
