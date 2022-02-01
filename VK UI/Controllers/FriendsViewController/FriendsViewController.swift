//
//  FriendsViewController.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 18.01.2022.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var friendsTableView: UITableView!
    
    let reusableIdentifierFriends = "reusableIdentifierFriends"
    let friendsCellPressedSegue = "friendsCellPressed"
    var friendsArray = [User]()
    var sectionLetters = [String]()
    
    let friendsNames = [
        "Adele": [UIImage(named: "Adele")!],
        "Cate Blanchett": [UIImage(named: "Cate Blanchett")!],
        "Damiano David": [UIImage(named: "Damiano David")!],
        "Emily Blunt": [UIImage(named: "Emily Blunt")!],
        "Helena Bonham Carter": [UIImage(named: "Helena Bonham Carter")!],
        "Johnny Depp": [UIImage(named: "Johnny Depp")!],
        "Keanu Reeves": [UIImage(named: "Keanu Reeves")!],
        "Lady Gaga": [UIImage(named: "Lady Gaga")!],
        "Lana Parilla": [UIImage(named: "Lana Parilla")!],
        "Meryl Streep": [UIImage(named: "Meryl Streep")!],
        "Rihanna": [UIImage(named: "Rihanna")!],
        "Robert Downey Jr": [UIImage(named: "Robert Downey Jr")!],
        "Ryan Reynolds": [UIImage(named: "Ryan Reynolds")!],
        "Sara Ramirez": [UIImage(named: "Sara Ramirez")!],
        "Sarah Paulson": [UIImage(named: "Sarah Paulson")!],
        "Timothee Chalamet": [UIImage(named: "Timothee Chalamet")!]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillFriendsArray()
        fillSectionLetters()
        
        friendsTableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: reusableIdentifierFriends)
        friendsTableView.rowHeight = 70
        friendsTableView.dataSource = self
        friendsTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == friendsCellPressedSegue,
           let galleryViewController = segue.destination as? GalleryViewController,
           let friend = sender as? User {
            galleryViewController.photos = friend.photos
        }
    }
    
}
