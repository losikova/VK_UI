//
//  GalleryCollectionViewCell.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 19.01.2022.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    var photoImageView = UIImageView()
    
    var isLiked = false
    var likeButton: UIButton = {
        let heart = UIButton()
        heart.setImage(UIImage(systemName: "heart"), for: .normal)
        heart.tintColor = .red
        return heart
    }()
    var likesCounter: UILabel = {
        let counter = UILabel()
        counter.text = "0"
        return counter
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        let view = AvatarView()
        contentView.addSubview(view)
        
        view.addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 40),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            photoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -40)
        ])
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = 130
        photoImageView.contentMode = .scaleAspectFill
 
        view.layer.shadowColor = UIColor.red.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 15
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        
//        likesImageView.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        contentView.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeButton.heightAnchor.constraint(equalToConstant: 20),
            likeButton.widthAnchor.constraint(equalToConstant: 20),
            likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            likeButton.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
        likeButton.clipsToBounds = true
        
        contentView.addSubview(likesCounter)
        likesCounter.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likesCounter.heightAnchor.constraint(equalToConstant: 20),
            likesCounter.bottomAnchor.constraint(equalTo: likeButton.bottomAnchor),
            likesCounter.rightAnchor.constraint(equalTo: likeButton.leftAnchor)
        ])
        likesCounter.clipsToBounds = true
        
        likeButton.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
    }
    
    @objc func likeTapped() {
        if isLiked {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likesCounter.text = String(Int(likesCounter.text!)! - 1)
            isLiked = false
        } else {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likesCounter.text = String(Int(likesCounter.text!)! + 1)
            isLiked = true
        }
    }

}
