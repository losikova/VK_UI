//
//  NewsTableViewCell.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 31.01.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    var avtor = String()
    var date = String()
    
    var inscriptionLabel = UILabel()
    
    var photosView = UIImageView()
    
    private var bottomView = UIView()
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        setup()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup() {
        let avatarView = AvatarView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 60), name: avtor, date: date)
        self.addSubview(avatarView)
        
        self.addSubview(inscriptionLabel)
        inscriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inscriptionLabel.topAnchor.constraint(equalTo: avatarView.bottomAnchor),
            inscriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            inscriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
        inscriptionLabel.numberOfLines = 3
        inscriptionLabel.clipsToBounds = true
        
        self.addSubview(photosView)
        photosView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photosView.topAnchor.constraint(equalTo: inscriptionLabel.bottomAnchor),
            photosView.leftAnchor.constraint(equalTo: self.leftAnchor),
            photosView.rightAnchor.constraint(equalTo: self.rightAnchor),
            photosView.heightAnchor.constraint(equalTo: self.widthAnchor)
        ])
        photosView.contentMode = .scaleAspectFill
        photosView.clipsToBounds = true
    }

}
