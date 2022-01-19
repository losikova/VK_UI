//
//  FriendsViewController.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 18.01.2022.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var friendsTableView: UITableView!
    let reusableIdentifierFriends = "FriendCell"
    var friendsArray = [User]()
    
    let friendsNames = [
        "Adele",
        "Cate Blanchett",
        "Damiano David",
        "Emily Blunt",
        "Helena Bonham Carter",
        "Johnny Depp",
        "Keanu Reeves",
        "Lady Gaga",
        "Lana Parilla",
        "Meryl Streep",
        "Rihanna",
        "Robert Downey Jr",
        "Ryan Reynolds",
        "Sara Ramírez",
        "Sarah Paulson",
        "Timothée Chalamet"
    ]
    
    func fillFriendsArray() {
        for name in friendsNames {
            let friend = User(name: name, avatar: UIImage(named: name)!)
            friendsArray.append(friend)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillFriendsArray()
        friendsTableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: reusableIdentifierFriends)
        friendsTableView.rowHeight = 70
        friendsTableView.dataSource = self
        friendsTableView.delegate = self
    }
    

}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendsTableView.dequeueReusableCell(withIdentifier: reusableIdentifierFriends, for: indexPath) as! FriendsTableViewCell
        cell.avatarImageView.layer.cornerRadius = 25
        cell.configure(friend: friendsArray[indexPath.row])
        return cell
    }
    
}
