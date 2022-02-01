//
//  FriendsTableViewCell.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 17.01.2022.
//

import UIKit

protocol FreindsTableViewCellDelegate: AnyObject {
    func didTapOn()
    
}

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var friendsTableViewCell: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        nameLabel.text = nil
        addAvatarView(image: nil)
    }
    
    func configure(friend: User) {
        avatarImageView.image = friend.avatar
        nameLabel.text = friend.name
        addAvatarView(image: friend.avatar)
    }
    
    func configure(group: Group) {
        avatarImageView.image = group.icon
        nameLabel.text = group.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension FriendsTableViewCell {
    
    func addAvatarView(image: UIImage?) {
//        let cellWidth = friendsTableViewCell.frame.width
//        let cellHeight = friendsTableViewCell.frame.height
//        let avatarImage = AvatarView(frame: CGRect(x: cellWidth - 66, y: 8, width: 50, height: 50))
//        let imageView = UIImageView.init(image: image)
//
//        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.cornerRadius = 25
//        imageView.clipsToBounds = true
//        avatarImage.layer.shadowColor = UIColor.black.cgColor
//        avatarImage.layer.shadowOpacity = 1
//        avatarImage.layer.shadowRadius = 25
//        avatarImage.layer.shadowOffset = CGSize.zero
////        avatarImage.layer.shadowColor = UIColor.black.cgColor
////        avatarImage.layer.shadowRadius = 25
////        avatarImage.layer.shadowOpacity = 0.5
//
//        avatarImage.clipsToBounds = true
//        avatarImage.addSubview(imageView)
//        friendsTableViewCell.addSubview(avatarImage)
//
////        avatarImage = AvatarView(frame: CGRect(x: width - 66, y: 10, width: 50, height: 50))
        
        
    }
    
}
