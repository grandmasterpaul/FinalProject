//
//  tab bar.swift
//  FinalProject
//
//  Created by Jadyn Hart (student LM) on 3/21/24.
//

import SwiftUI

enum Tabs: Int{
    case opening = 0
    case articles = 1
    case topStories = 2
}

struct tab_bar: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        HStack (alignment: .center){
            
            
            Button {
               
                selectedTab = .opening
            } label: {
                GeometryReader{ geo in
                    
                    if selectedTab == .opening{
                        
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(width: geo.size.width/2, height: 4)
                            .padding(.leading, geo.size.width/4)
                        
                        VStack (alignment: .center, spacing: 4){
                            
                            
                            
                            Image(systemName: "house")
                                .resizable()
                                .scaledToFit()
                                .frame(width:24, height: 24)
                            Text("Opening")
                        }
                        .frame(width: geo.size.width, height: geo.size.height)
                    }
                }
                
                Button {
                    
                    selectedTab = .articles
                } label: {
                    
                    VStack (alignment: .center, spacing: 4){
                        Image(systemName: "bubble.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width:24, height: 24)
                        Text("Articles")
                        
                    }
                }
                
                Button {
                    
                    selectedTab = .topStories
                } label: {
                    GeometryReader{ geo in
                        
                        if selectedTab == .topStories{
                            
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(width: geo.size.width/2, height: 4)
                                .padding(.leading, geo.size.width/4)
                        }
                        VStack (alignment: .center, spacing: 4){
                            Image(systemName: "bubble.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width:24, height: 24)
                            Text("Top Stories")
                        }
                        .frame(width: geo.size.width, height: geo.size.height)
                    }
                }
            }
            .frame(height: 82)
        }
    }
    
    struct tab_bar_Previews: PreviewProvider {
        static var previews: some View {
            tab_bar(selectedTab: .constant(.opening))
        }
    }
}
