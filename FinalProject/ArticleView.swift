//
//  ArticleView.swift
//  FinalProject
//
//  Created by Nolan Walters (student LM) on 4/9/24.
//

import SwiftUI

struct ArticleView: View {
    
  // @State var showView: ShowView = .home
    
    var body: some View {
        
        VStack{
            Text(" Top Stories ")
                .font(Constants.textFont)
                .background(Color.red)
                .cornerRadius(10)
                .foregroundColor(.white)
                .shadow(radius: 5)
                .frame(width: 150)
                .padding(.top, 5)
            
           Spacer()
            
           // tab_bar(ShowView: $ShowView)
        }
    
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}
