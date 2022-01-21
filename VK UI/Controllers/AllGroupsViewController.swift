//
//  AllGroupsViewController.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 18.01.2022.
//

import UIKit

class AllGroupsViewController: UIViewController {

    @IBOutlet weak var allGroupsTableView: UITableView!
    
    let reuseIdentifierGroups = "reuseIdentifierGroups"
    var groupArray = [Group]()
    var selectedGroup: Group?
    
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
        allGroupsTableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierGroups)
        allGroupsTableView.rowHeight = 70
        allGroupsTableView.delegate = self
        allGroupsTableView.dataSource = self
    }
    
    
    
}

extension AllGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allGroupsTableView.dequeueReusableCell(withIdentifier: reuseIdentifierGroups) as! FriendsTableViewCell
        cell.avatarImageView.layer.cornerRadius = 25
        cell.configure(group: groupArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedGroup = groupArray[indexPath.row]
        performSegue(withIdentifier: "addGroup", sender: nil)
    }
    
}
