//
//  NewsTableViewCell.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 31.01.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    var inscriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        return label
    }()
    var photosView: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "Adele")
        return photo
    }()
    var bottomView = UIView()
//    var shareLabel = UILabel()
    
//    var photosArray = [UIImage]()
    
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
        
        let avatarView = AvatarView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 60))
        contentView.addSubview(avatarView)
        
        contentView.addSubview(inscriptionLabel)
        inscriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inscriptionLabel.topAnchor.constraint(equalTo: avatarView.bottomAnchor),
            inscriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            inscriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
        inscriptionLabel.numberOfLines = 3
        inscriptionLabel.backgroundColor = .green
        inscriptionLabel.clipsToBounds = true
        
        contentView.addSubview(photosView)
        photosView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photosView.topAnchor.constraint(equalTo: inscriptionLabel.bottomAnchor),
            photosView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            photosView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            photosView.heightAnchor.constraint(equalTo: self.widthAnchor)
        ])
        photosView.contentMode = .scaleAspectFill
        photosView.clipsToBounds = true
        
        contentView.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: photosView.bottomAnchor),
            bottomView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            bottomView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            bottomView.heightAnchor.constraint(equalTo: self.widthAnchor)
        ])
        bottomView.clipsToBounds = true
        bottomView.isUserInteractionEnabled = true
        
        let likesView = LikesView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        bottomView.addSubview(likesView)
        
    }

}
