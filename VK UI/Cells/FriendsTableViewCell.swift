//
//  FriendsTableViewCell.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 17.01.2022.
//

import UIKit

protocol FriendsTableViewCellProtocol: AnyObject {
    func performSegueAfterTap(row: IndexPath)
}

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var friendsTableViewCell: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var delegate: FriendsTableViewCellProtocol?
    var rowNumber = IndexPath()
    
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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    }
    
    @IBAction func imagePressed(_ sender: UIButton) {
        let scale: CGFloat = 20
        let frame = avatarImageView.frame 
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.1,
                       options: [],
                       animations: {
            self.avatarImageView.frame = CGRect(x: frame.origin.x - scale/2, y: frame.origin.y - scale/2, width: frame.width + scale, height: frame.height + scale)
        },
                       completion: {_ in
            self.delegate?.performSegueAfterTap(row: self.rowNumber)
        })
        
    }
    
}

extension FriendsTableViewCell: FriendsTableViewCellProtocol {
    func performSegueAfterTap(row: IndexPath) {
        delegate?.performSegueAfterTap(row: row)
    }
    
    
}

