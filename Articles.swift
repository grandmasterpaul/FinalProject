//
//  Articles.swift
//  FinalProject
//
//  Created by Jadyn Hart (student LM) on 4/2/24.
//

import SwiftUI

struct Articles: View {
    
    @State var selectedTabs: Tabs = .articles
    
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        tab_bar(selectedTab: $selectedTabs)
    }
}

struct Articles_Previews: PreviewProvider {
    static var previews: some View {
        Articles()
    }
}
