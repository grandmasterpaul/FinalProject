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
    let favoriteVC = FavoriteArticlesViewController()
    
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
        addChildViewController(favoriteVC)
        self.view.addSubview(articlesVC.view)
        self.view.addSubview(contentVC.view)
        self.view.addSubview(favoriteVC.view)
        
        articlesVC.didMove(toParentViewController: self)
        contentVC.didMove(toParentViewController: self)
        favoriteVC.didMove(toParentViewController: self)
        
        articlesVC.view.frame = self.view.bounds
        contentVC.view.frame = self.view.bounds
        favoriteVC.view.frame = self.view.bounds
        articlesVC.view.isHidden = true
        favoriteVC.view.isHidden = true
    }
    
    @IBAction func didTapSegment(segment: UISegmentedControl){
        contentVC.view.isHidden = true
        articlesVC.view.isHidden = true
        favoriteVC.view.isHidden = true
        
        if segment.selectedSegmentIndex == 0{
            contentVC.view.isHidden = false
        }else if segment.selectedSegmentIndex == 1{
            articlesVC.view.isHidden = false
            articlesVC.resetHearts()
        }else if segment.selectedSegmentIndex == 2{
            favoriteVC.view.isHidden = false
            favoriteVC.loadFavoriteArticles()
        }
    }
}
