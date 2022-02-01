//
//  AvatarView.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 28.01.2022.
//

import UIKit

class AvatarView: UIView {
    
    var photo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Adele")
        return image
    }()
    var name: UILabel = {
        let label = UILabel()
        label.text = "Adele"
        return label
    }()
    var date: UILabel = {
        let label = UILabel()
        label.text = "вчера 16:15"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        self.addSubview(photo)
        self.addSubview(name)
        self.addSubview(date)
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            photo.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            photo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            photo.widthAnchor.constraint(equalTo: photo.heightAnchor)
        ])
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = (self.bounds.height - 16) / 2
        photo.clipsToBounds = true
        
        name.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            name.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            name.leftAnchor.constraint(equalTo: photo.rightAnchor, constant: 16),
            name.bottomAnchor.constraint(equalTo: date.topAnchor, constant: -8)
        ])
        name.backgroundColor = .red
        name.clipsToBounds = true
        
        date.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            date.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            date.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            date.leftAnchor.constraint(equalTo: photo.rightAnchor, constant: 16)
        ])
        date.backgroundColor = .yellow
        date.clipsToBounds = true
        
        self.backgroundColor = .cyan
        
    }
}
