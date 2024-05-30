import UIKit
import NewsAPISwift
import SafariServices

class FavoriteArticlesViewController: UITableViewController {

    var favoriteArticles = [NewsArticle]() {
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.dataSource = self
        
        self.view.backgroundColor = Constants.backgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View will appear") // Print statement to check if method is called
        loadFavoriteArticles() // Reload data when the view is about to appear
    }
    
    func loadFavoriteArticles() {
        favoriteArticles = NewsArticle.loadFavoriteArticles()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteArticles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        let article = favoriteArticles[indexPath.row]
        cell.textLabel?.text = "\(article.title)"
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = Constants.textFont
        
        // Add a favorite button to the cell
        let favoriteButton = UIButton(type: .custom)
        let buttonImage = article.isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        favoriteButton.setImage(buttonImage, for: .normal)
        favoriteButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        favoriteButton.tintColor = article.isFavorite ? .red : .gray // Make the heart red if it's a favorite, otherwise gray
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped(_:)), for: .touchUpInside)
        cell.accessoryView = favoriteButton
        
        return cell
    }
    
    // Function to toggle favorite status of an article
    func toggleFavoriteStatus(at index: Int) {
        favoriteArticles[index].isFavorite.toggle()
        //saveFavoriteArticles()
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }

    @objc func favoriteButtonTapped(_ sender: UIButton) {
        // Get the indexPath of the cell containing the tapped button
        let point = sender.convert(CGPoint.zero, to: self.tableView)
        if let indexPath = self.tableView.indexPathForRow(at: point) {
            // Toggle the favorite status of the corresponding article
            toggleFavoriteStatus(at: indexPath.row)
        }
        // Reload the table view to update the favorite button
        tableView.reloadData()
        loadFavoriteArticles()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = favoriteArticles[indexPath.row].url
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func reloadButton(_ sender: Any) {
        loadFavoriteArticles()
    }
}
