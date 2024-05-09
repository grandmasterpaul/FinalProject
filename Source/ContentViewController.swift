//
//  ContentView.swift
//  FinalProject
//
//  Created by Paul Stricker (student LM) on 3/8/24.
//



//fix jaydns tab bar/make it work
import UIKit
import SwiftUI

enum ShowView{
    case open, home
}

class ContentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = HostingView(rootView: HomeView())
    }
}
//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
