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
    var loaded = true
    var hasAppeared = false
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
        
        if (!hasAppeared){
            
            super.viewDidAppear(animated)
            
            tableView.rowHeight = UITableViewAutomaticDimension
            navigationItem.title = "Only Good News"
    
            self.articles = []
            let problematics = ["the-jerusalem-post", "vice-news", "wired"]
            let politicalSources = ["breitbart-news", "fox-news", "politico", "the-hill", "the-huffington-post"]
            let sportsSources = ["bbc-sport","espn", "espn-cric-info", "four-four-two", "nfl-news", "nhl-news", "talksport", "the-sport-bible"]
            let businessSources = ["australian-financial-review", "business-insider-uk", "crypto-coins-news", "hacker-news"]
            let generalSources = ["associated-press", "bbc-news", "al-jazeera-english", "ars-technica", "axios", "fortune", "msnbc", "nbc-news", "news-com-au", "newsweek", "rte", "the-globe-and-mail", "the-hindu", "the-irish-times", "the-lad-bible", "the-washington-post", "time", "usa-today", "recode"]
            let entertainmentSources = ["entertainment-weekly", "ign", "mashable", "mtv-news", "mtv-news-uk", "polygon"]
            let scienceSources = ["medical-news-today", "new-scientist", "next-big-future", "techcrunch", "techradar", "the-next-web", "the-verge"]
            
            let partialSources = ["new-scientist"]
            let partialSources2 = ["new-scientist","associated-press", "bbc-news", "entertainment-weekly"]
            let allSources = ["abc-news", "abc-news-au", "al-jazeera-english", "ars-technica", "associated-press", "australian-financial-review", "axios", "bbc-news", "bbc-sport", "breitbart-news", "business-insider-uk", "crypto-coins-news", "entertainment-weekly", "espn", "espn-cric-info", "fortune", "four-four-two", "fox-news", "hacker-news", "ign", "mashable", "medical-news-today", "msnbc", "mtv-news", "mtv-news-uk", "nbc-news", "new-scientist", "news-com-au", "newsweek", "next-big-future", "nfl-news", "nhl-news", "politico", "polygon", "recode", "rte", "talksport", "techcrunch", "techradar", "the-globe-and-mail", "the-hill", "the-hindu", "the-huffington-post", "the-irish-times", "the-jerusalem-post", "the-lad-bible", "the-next-web", "the-sport-bible", "the-verge", "the-washington-post", "time", "usa-today", "vice-news", "wired"]
            
            
            
            for source in partialSources{
                newsAPI.getTopHeadlines(q: "", sources: [source]){ result in
                    switch result {
                    case .success(let articles):
                        
                        //  self.articles.append(contentsOf: articles)
                        for i in 0...articles.count-1 {
                            
                            if (determinePositivity(of: articles[i].title)) {
                                self.articles.append(articles[i])
                            }
                        }
                    case .failure(let error):
                        print("\(error)")
                    }
                case .failure(let error):
                    print("\(error)")
                }
            }
        }
        hasAppeared=true
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
  
    @IBAction func ReloadButton(_ sender: Any) {
        hasAppeared = false;
        articles = []
        viewDidAppear(true)
        self.tableView.reloadData()
        
    }
    
}
func determinePositivity(of headline: String) -> Bool {
    
    var isPos: Bool = false
    
    let positiveKeywords = ["good", "positive", "success", "uplifting", "promising", "kindness", "help", "cure", "triumph", "breakthrough", "improve", "recover", "praise", " sav", "wonder", "new life", "anal catapult", "" ]
    //let negativeKeywords = ["gviuldfhg"]
    
    let positiveGroups = [["lower","risk"], ["slow", "progression"], ["towards", "achieving"]]
    let negativeGroups = [["high","risk"]]
    
    
    let negativeKeywords = ["dead", "kill", "deaths", "injured", "vote", "elect", "law", "president", "attorney", "lawyer", "inadequate", "jail", "prison", "president", "politic", "dying", "crime", "criminal", "convict", "court", "ballot", "shot", "shoot", "guilty", "innocent", "scam", "bill", "airdrop", "attack", "veto", "ban", "prison", "nude", "slain", "fatal", "devastat", " sex", "russia", "palestin", "murder", "biden", "trump", "elect", "fossil fuel", "abuse", "cruel", " invad", "invasion", "gaza", "israel", "fears", "climate", "syria", " AI ", "AI-", "decline", "collapse", "should"]
    
          for keyword in positiveKeywords {
        if headline.lowercased().contains(keyword) {
           isPos=true
        }
        
              for group in positiveGroups {
                  if (hasAll(words: group, headline: headline)) {
                      isPos = true
                  }
              }
              for group in negativeGroups {
                  if (hasAll(words: group, headline: headline)) {
                      return false
                  }
              }
              
    }
    for keyword in negativeKeywords {
        if headline.lowercased().contains(keyword) {
            return false
        }
        
    }
    
    return isPos
}

func hasAll (words: [String], headline: String) -> Bool {
    
    var hasAll=true
    
    for word in words {
        if !headline.lowercased().contains(word.lowercased()) {
            hasAll=false
        }
    }
    return hasAll
}

