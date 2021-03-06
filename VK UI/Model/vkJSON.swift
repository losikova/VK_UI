//
//  vkJSON.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 14.02.2022.
//

import Foundation
import UIKit

class vkJSON {
    func reguest(complition: (([PostsJSON]) -> ())?) {
        guard let httpURL = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        let httpSession = URLSession.shared.dataTask(with: httpURL) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let validData = data else {return}
            
            do {
                let codableData = try JSONDecoder().decode([PostsJSON].self, from: validData)
                
                print(codableData.first?.title)
            } catch let error {
                print("Catch error", error.localizedDescription)
            }
            
        }.resume()
    }
}
