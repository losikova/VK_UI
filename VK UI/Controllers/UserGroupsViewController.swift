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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userGroupsTableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierGroups)
        userGroupsTableView.rowHeight = 70
        userGroupsTableView.delegate = self
        userGroupsTableView.dataSource = self
    }
    
    func isItemAlreadyInArraay(group: Group) -> Bool {
        return groupArray.contains{sourceGroup in
            sourceGroup.name == group.name
        }
    }
    
    @IBAction func unwindAddGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup",
           let allGroupsViewController = segue.source as? AllGroupsViewController,
           let selectedGroup = allGroupsViewController.selectedGroup as? Group {
            if isItemAlreadyInArraay(group: selectedGroup) {return}
            self.groupArray.append(selectedGroup)
            userGroupsTableView.reloadData()
        }
        
    }
    
}

extension UserGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userGroupsTableView.dequeueReusableCell(withIdentifier: reuseIdentifierGroups) as! FriendsTableViewCell
//        cell.avatarImageView.layer.cornerRadius = 30
        cell.configure(group: groupArray[indexPath.row])
        return cell
    }
    
}
