//
//  TabViews.swift
//  FinalProject
//
//  Created by Jadyn Hart (student LM) on 4/2/24.
//

import SwiftUI

struct TabViews: View {
    
    @State var selectedTab: Tabs = .opening
    
    var body: some View {
        
        VStack{
            
            Text("Sunny Side Stories")
            
            Spacer()
            
           tab_bar(selectedTab: $selectedTab)
        }
    }
}
struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        TabViews()
    }
}
