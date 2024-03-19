//
//  ArticleView.swift
//  FinalProject
//
//  Created by Nolan Walters (student LM) on 4/9/24.
//

import SwiftUI

struct ArticleView: View {
    
   // @State var selectedTab: Tabs = .HomeView
    
    var body: some View {
        
        VStack{
            Text("Articles here:")
            
            Spacer()
            
            //tab_bar(selectedTab: $selectedTab)
        }
    
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}
