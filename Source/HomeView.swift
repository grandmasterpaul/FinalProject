//
//  HomeView.swift
//  Example
//
//  Created by David Oprea (student LM) on 4/29/24.
//  Copyright © 2024 Lucas Lima. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
           
            Text("Only Good News")
                .foregroundColor(.red)
                .padding(.top,CGFloat(100))
            Spacer()
            
            Image("logo2")
                .resizable()
                //.frame(width: 60, height: 60)
                .padding(.bottom,300)
               
                
            
        }
    }
}
    
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

