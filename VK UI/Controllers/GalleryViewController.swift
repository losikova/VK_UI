//
//  GalleryViewController.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 18.01.2022.
//

import UIKit

class GalleryViewController: UIViewController {

    
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
    let reuserIdentifierGallery = "reuserIdentifierGallery"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        galleryCollectionView.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuserIdentifierGallery)
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
    }

}

extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: reuserIdentifierGallery, for: indexPath) as! GalleryCollectionViewCell
        cell.photoImageView.image = UIImage(named: "Adele")
        return cell
    }
    
}
