//
//  ListSourcesViewController.swift
//  NewsAPISwift
//
//  Created by lucas lima on 6/3/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import NewsAPISwift

class ListSourcesViewController: UITableViewController {

    let newsAPI = NewsAPI(apiKey: "abbd92b503ab44a7ac01aeae49855bb0")
    var sources = [NewsSource]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NewsAPISwift"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        newsAPI.getSources(category: .all, language: .en, country: .all) { result in
            switch result {
            case .success(let  sourceList):
                self.sources = sourceList
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ListArticlesViewController {
            let articlesViewController = segue.destination as! ListArticlesViewController
            
            articlesViewController.newsAPI = newsAPI
            articlesViewController.source = sources[tableView.indexPathForSelectedRow!.row]
            articlesViewController.tableView.reloadData()
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let articlesViewController = UIStoryboard(name: "Main", bundle: nil)
//            .instantiateViewController(withIdentifier: "ListArticlesViewController") as! ListArticlesViewController
//
//        articlesViewController.newsAPI = newsAPI
//        articlesViewController.source = sources[indexPath.row]
//
//        navigationController?.pushViewController(articlesViewController, animated: true)
//    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SourceCell", for: indexPath)
        
        cell.textLabel?.text = sources[indexPath.row].name
        
        return cell
    }
}
