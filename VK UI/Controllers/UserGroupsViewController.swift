//
//  UserGroupsViewController.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 18.01.2022.
//

import UIKit

class UserGroupsViewController: UIViewController {

    
    @IBOutlet weak var userGroupsTableView: UITableView!
    
    let reuseIdentifierGroups = "reuseIdentifierGroups"
    var groupArray = [Group]()
    let groupsNames = [
        "Doggy",
        "пакетик брать будете?",
        "quite mooo"
    ]
    
    func fillGroupArray() {
        for name in groupsNames {
            let group = Group(name: name, icon: UIImage(named: name)!)
            groupArray.append(group)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillGroupArray()
        userGroupsTableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierGroups)
        userGroupsTableView.rowHeight = 70
        userGroupsTableView.delegate = self
        userGroupsTableView.dataSource = self
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        
        
        }
    
}

extension UserGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userGroupsTableView.dequeueReusableCell(withIdentifier: reuseIdentifierGroups) as! FriendsTableViewCell
        cell.avatarImageView.layer.cornerRadius = 30
        cell.configure(group: groupArray[indexPath.row])
        return cell
    }
    
}
