//
//  ContentViewController.swift
//  Example
//
//  Created by David Oprea (student LM) on 4/30/24.
//  Copyright © 2024 Lucas Lima. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class ViewController: UIViewController{
    
    //var child = UIHostingController(rootView: ContentView())
    let articlesVC = ListArticlesViewController()
    let contentVC = ContentViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        /*
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.view.frame = self.view.bounds
        self.view.addSubview(child.view)
         */
    }
    
    private func setup(){
        addChildViewController(articlesVC)
        addChildViewController(contentVC)
        self.view.addSubview(articlesVC.view)
        self.view.addSubview(contentVC.view)
        
        articlesVC.didMove(toParentViewController: self)
        contentVC.didMove(toParentViewController: self)
        
        articlesVC.view.frame = self.view.bounds
        contentVC.view.frame = self.view.bounds
        articlesVC.view.isHidden = true
    }
    
    @IBAction func didTapSegment(segment: UISegmentedControl){
        contentVC.view.isHidden = true
        articlesVC.view.isHidden = true
        
        if segment.selectedSegmentIndex == 0{
            contentVC.view.isHidden = false
        }else if segment.selectedSegmentIndex == 1{
            articlesVC.view.isHidden = false
        }
    }
}
