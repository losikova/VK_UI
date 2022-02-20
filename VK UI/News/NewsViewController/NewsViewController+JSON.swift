//
//  NewsTableViewCell+JSON.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 14.02.2022.
//

import Foundation

extension NewsViewController {
    
    func getData() {
        vkJSON().reguest { codabelData in
            self.array = codabelData
            self.newsTableView.reloadData()
            print(codabelData, "Fetch")
        }
    }
    
    
}
