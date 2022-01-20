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
        "Adele": [UIImage(named: "Adele")!, UIImage(named: "Adele")!],
        "Cate Blanchett": [UIImage(named: "Cate Blanchett")!, UIImage(named: "Cate Blanchett")!],
        "Damiano David": [UIImage(named: "Damiano David")!, UIImage(named: "Damiano David")!],
        "Emily Blunt": [UIImage(named: "Emily Blunt")!, UIImage(named: "Emily Blunt")!],
        "Helena Bonham Carter": [UIImage(named: "Helena Bonham Carter")!, UIImage(named: "Helena Bonham Carter")!],
        "Johnny Depp": [UIImage(named: "Johnny Depp")!, UIImage(named: "Johnny Depp")!],
        "Keanu Reeves": [UIImage(named: "Keanu Reeves")!, UIImage(named: "Keanu Reeves")!],
        "Lady Gaga": [UIImage(named: "Lady Gaga")!, UIImage(named: "Lady Gaga")!],
        "Lana Parilla": [UIImage(named: "Lana Parilla")!, UIImage(named: "Lana Parilla")!],
        "Meryl Streep": [UIImage(named: "Meryl Streep")!, UIImage(named: "Meryl Streep")!],
        "Rihanna": [UIImage(named: "Rihanna")!, UIImage(named: "Rihanna")!],
        "Robert Downey Jr": [UIImage(named: "Robert Downey Jr")!, UIImage(named: "Robert Downey Jr")!],
        "Ryan Reynolds": [UIImage(named: "Ryan Reynolds")!, UIImage(named: "Ryan Reynolds")!],
        "Sara Ramírez": [UIImage(named: "Sara Ramírez")!, UIImage(named: "Sara Ramírez")!],
        "Sarah Paulson": [UIImage(named: "Sarah Paulson")!, UIImage(named: "Sarah Paulson")!],
        "Timothée Chalamet": [UIImage(named: "Timothée Chalamet")!, UIImage(named: "Timothée Chalamet")!]
    ]
    
    func fillFriendsArray() {
        for (name, photos) in friendsNames {
            let friend = User(name: name, avatar: UIImage(named: name)!, photos: photos)
            friendsArray.append(friend)
        }
        friendsArray.sort(by: {$0.name < $1.name})
    }
    
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
    
    func fillSectionLetters() {
        for friend in friendsArray {
            let letter = String(friend.name.prefix(1)).uppercased()
            if !sectionLetters.contains(letter) {
                sectionLetters.append(letter)
            }
        }
    }
    
    func friendsBySection(letter: String) -> [User] {
        var resultArray = [User]()
        for friend in friendsArray {
            if friend.name.prefix(1).uppercased() == letter.uppercased() {
                resultArray.append(friend)
            }
        }
        return resultArray
    }
    
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionLetters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsBySection(letter: sectionLetters[section]).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendsTableView.dequeueReusableCell(withIdentifier: reusableIdentifierFriends, for: indexPath) as! FriendsTableViewCell
        cell.avatarImageView.layer.cornerRadius = 25
        cell.configure(friend: friendsBySection(letter: sectionLetters[indexPath.section])[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = friendsBySection(letter: sectionLetters[indexPath.section])
        performSegue(withIdentifier: friendsCellPressedSegue, sender: section[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionLetters[section]
    }
    
}
