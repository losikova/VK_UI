//
//  NewsViewController.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 31.01.2022.
//

import UIKit

struct news {
    var avtor: String
    var date: String
    var inscription: String
    var image: UIImage
}

class NewsViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    let reuserIdentifierNews = "reuserIdentifierNews"
    let newsArray = [
        news(avtor: "Adele", date: "12:12:12", inscription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: UIImage(named: "Adele")!),
        news(avtor: "Lady Gaga", date: "12:12:12", inscription: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: UIImage(named: "Lady Gaga")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: reuserIdentifierNews)
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: reuserIdentifierNews, for: indexPath) as! NewsTableViewCell
        
        let news = newsArray[indexPath.item]
        cell.avtor = news.avtor
        cell.date = news.date
        cell.inscriptionLabel.text = news.inscription
        cell.photosView.image = news.image
        
        cell.delegate = self
        
        return cell
    }

}

extension NewsViewController: NewsTableViewCellProtocol {
    func setRowHeight(height: CGFloat) {
        newsTableView.rowHeight = height
    }
    
}

