//
//  ListArticlesViewController.swift
//  NewsAPISwift
//
//  Created by lucas lima on 6/5/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import NewsAPISwift

class StoryViewController: UIViewController {

    var newsAPI: NewsAPI!
    var source: NewsSource!
    
    var story: String?
    
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let s = story {
            print(s)
            Label.numberOfLines = 0
            Label.text = s
        }else{
            print("None")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
}
