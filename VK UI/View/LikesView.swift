//
//  LikesView.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 31.01.2022.
//

import UIKit

class LikesView: UIView {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        
        self.addSubview(likesCounter)
        likesCounter.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likesCounter.heightAnchor.constraint(equalToConstant: 20),
            likesCounter.widthAnchor.constraint(equalToConstant: 20),
            likesCounter.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            likesCounter.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
        likeButton.clipsToBounds = true
        
        self.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeButton.heightAnchor.constraint(equalToConstant: 20),
            likeButton.bottomAnchor.constraint(equalTo: likesCounter.bottomAnchor),
            likeButton.rightAnchor.constraint(equalTo: likesCounter.leftAnchor)
        ])
        likeButton.clipsToBounds = true
        
        likeButton.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
    }
    
    @objc func likeTapped() {
        if isLiked {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likesCounter.text = String(Int(likesCounter.text!)! - 1)
            isLiked.toggle()
        } else {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likesCounter.text = String(Int(likesCounter.text!)! + 1)
            isLiked.toggle()
        }
    }
    
}
