//
//  FriendsViewController + Delegate.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 23.01.2022.
//

import UIKit

extension FriendsViewController: UITableViewDelegate, FriendsTableViewCellProtocol {
    func performSegueAfterTap(row: IndexPath) {
        tableView(friendsTableView, didSelectRowAt: row)
    }
    
    
}
