//
//  FriendsViewController + DataSource.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 23.01.2022.
//

import UIKit

extension FriendsViewController: UITableViewDataSource {
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
        cell.rowNumber = indexPath
        
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = friendsBySection(letter: sectionLetters[indexPath.section])
        
        performSegue(withIdentifier: friendsCellPressedSegue, sender: section[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionLetters[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionLetters
    }
    
}
