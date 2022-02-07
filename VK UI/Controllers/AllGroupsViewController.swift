//
//  AllGroupsViewController.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 18.01.2022.
//

import UIKit

class AllGroupsViewController: UIViewController {

    @IBOutlet weak var allGroupsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar! 
    
    let reuseIdentifierGroups = "reuseIdentifierGroups"
    var groupArray = [Group]()
    var selectedGroup: Group?
    var savedGroupArray = [Group]()
    
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
        savedGroupArray = groupArray
        allGroupsTableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierGroups)
        allGroupsTableView.rowHeight = 70
        allGroupsTableView.delegate = self
        allGroupsTableView.dataSource = self
        searchBar.delegate = self
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

extension AllGroupsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.groupArray = self.savedGroupArray
        } else {
            self.groupArray = groupArray.filter({$0.name.lowercased().contains(searchText.lowercased())})
        }
        self.allGroupsTableView.reloadData()
    }
}
