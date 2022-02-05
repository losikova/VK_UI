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
    let newsArray = [news(avtor: "Adele", date: "12:12:12", inscription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: UIImage(named: "Adele")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: reuserIdentifierNews)
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.estimatedRowHeight = 50.0
        newsTableView.rowHeight = UITableView.automaticDimension
        newsTableView.footerView(forSection: 1)
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: reuserIdentifierNews, for: indexPath) as! NewsTableViewCell
        
        let news = newsArray[indexPath.item]
        cell.avtor = news.avtor
        cell.date = news.date
        cell.inscriptionLabel.text = news.inscription
        cell.photosView.image = news.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        
        let likesView = BottomItemView(item: .like, position: .first)
        let commentView = BottomItemView(item: .comment, position: .second)
        let shareView = BottomItemView(item: .share, position: .third)
        
        view.addSubview(likesView)
        view.addSubview(commentView)
        view.addSubview(shareView)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 540
    }
}
