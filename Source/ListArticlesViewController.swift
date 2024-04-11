//
//  ListArticlesViewController.swift
//  NewsAPISwift
//
//  Created by lucas lima on 6/5/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import NewsAPISwift
import SafariServices

class ListArticlesViewController: UITableViewController {

    var newsAPI = NewsAPI(apiKey: "abbd92b503ab44a7ac01aeae49855bb0")
    var source: NewsSource!
    var selectedProgram : String = ""

    
    var articles = [NewsArticle]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        navigationItem.title = "Only Good News"
        
        self.articles = []
        let partialSources = ["abc-news"]
        let allSources = ["abc-news", "abc-news-au", "al-jazeera-english", "ars-technica", "associated-press", "australian-financial-review", "axios", "bbc-news", "bbc-sport", "breitbart-news", "business-insider-uk", "crypto-coins-news", "entertainment-weekly", "espn", "espn-cric-info", "fortune", "four-four-two", "fox-news", "hacker-news", "ign", "mashable", "medical-news-today", "msnbc", "mtv-news", "mtv-news-uk", "nbc-news", "new-scientist", "news-com-au", "newsweek", "next-big-future", "nfl-news", "nhl-news", "politico", "polygon", "recode", "rte", "talksport", "techcrunch", "techradar", "the-globe-and-mail", "the-hill", "the-hindu", "the-huffington-post", "the-irish-times", "the-jerusalem-post", "the-lad-bible", "the-next-web", "the-sport-bible", "the-verge", "the-washington-post", "time", "usa-today", "vice-news", "wired"]
        for source in partialSources{
            newsAPI.getTopHeadlines(sources: [source]){ result in
                switch result {
                case .success(let articles):
                    self.articles.append(contentsOf: articles)
                case .failure(let error):
                    print("\(error)")
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        
        cell.textLabel?.adjustsFontSizeToFitWidth = false
        cell.textLabel?.minimumScaleFactor = 0.5
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(articles[indexPath.row].title) - \(articles[indexPath.row].source.name)"
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Articles" {
            if let storyViewController = segue.destination as? StoryViewController {
            storyViewController.story = selectedProgram
          }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Create a variable that you want to send based on the destination view controller
        // You can get a reference to the data by using indexPath shown below
        var url : URL? = articles[indexPath.row].url
        let vc = SFSafariViewController(url: url!)
        present(vc, animated: true, completion: nil)

        // Create an instance of PlayerTableViewController and pass the variable
        //let destinationVC = StoryViewController()
        //destinationVC.story = selectedProgram
        //print(selectedProgram)

        // Let's assume that the segue name is called playerSegue
        // This will perform the segue and pre-load the variable for you to use
        //performSegue(withIdentifier: "Articles", sender: self)
    }
}
