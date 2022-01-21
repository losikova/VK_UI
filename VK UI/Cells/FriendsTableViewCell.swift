//
//  FriendsTableViewCell.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 17.01.2022.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        nameLabel.text = nil
    }
    
    func configure(friend: User) {
        avatarImageView.image = friend.avatar
        nameLabel.text = friend.name
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
