//
//  LikesView.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 31.01.2022.
//

import UIKit

enum bottomViewItem {
    case like
    case comment
    case share
    case views
}

enum yPosition {
    case first
    case second
    case third
    case fourth
}

class BottomItemView: UIView {
    
    private var itemKind: bottomViewItem
    
    private var isLiked = false
    private var itemButton = UIButton()
    private var itemCounter = UILabel()
    
    init(item: bottomViewItem, position: yPosition) {
        self.itemKind = item
        
        switch position {
        case .first:
            super.init(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        case .second:
            super.init(frame: CGRect(x: 60, y: 0, width: 40, height: 20))
        case .third:
            super.init(frame: CGRect(x: 120, y: 0, width: 40, height: 20))
        case .fourth:
            super.init(frame: CGRect(x: 350, y: 0, width: 40, height: 20))
        }
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        self.itemKind = .like
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        itemButton.tintColor = UIColor(red: 0.45, green: 0.46, blue: 0.47, alpha: 1.00)
        itemCounter.tintColor = UIColor(red: 0.45, green: 0.46, blue: 0.47, alpha: 1.00)

        switch itemKind {
        case .like:
            itemButton.setImage(UIImage(systemName: "heart"), for: .normal)
            itemCounter.text = "0"
        case .comment:
            itemButton.setImage(UIImage(systemName: "bubble.left"), for: .normal)
            itemCounter.text = "10"
        case .share:
            itemButton.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
            itemCounter.text = "3"
        case .views:
            itemButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            itemCounter.text = "6"
        }
        
        self.addSubview(itemCounter)
        itemCounter.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemCounter.heightAnchor.constraint(equalToConstant: 20),
            itemCounter.widthAnchor.constraint(equalToConstant: 20),
            itemCounter.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            itemCounter.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
        itemButton.clipsToBounds = true
        
        self.addSubview(itemButton)
        itemButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemButton.heightAnchor.constraint(equalToConstant: 20),
            itemButton.bottomAnchor.constraint(equalTo: itemCounter.bottomAnchor),
            itemButton.rightAnchor.constraint(equalTo: itemCounter.leftAnchor)
        ])
        itemButton.clipsToBounds = true
        
        itemButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        switch itemKind {
        case .like:
            if isLiked {
                itemButton.setImage(UIImage(systemName: "heart"), for: .normal)
                itemCounter.text = String(Int(itemCounter.text!)! - 1)
                itemButton.tintColor = UIColor(red: 0.45, green: 0.46, blue: 0.47, alpha: 1.00)
                isLiked.toggle()
            } else {
                itemButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                itemCounter.text = String(Int(itemCounter.text!)! + 1)
                itemButton.tintColor = .red
                isLiked.toggle()
            }
        case .comment:
            print("comment tapped")
        case .share:
            print("share tapped")
        case .views:
            print("views tapped")
        }
        
    }
    
}
