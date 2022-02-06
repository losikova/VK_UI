//
//  GalleryCollectionViewCell.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 19.01.2022.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    var photoImageView = UIImageView()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        let view = UIView()
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
        
        let likesView = BottomItemView(item: .like)
        
        contentView.addSubview(likesView)
        
    }

}
