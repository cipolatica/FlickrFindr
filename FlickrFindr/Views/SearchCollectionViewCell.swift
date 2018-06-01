//
//  SearchCollectionViewCell.swift
//  FlickrFindr
//
//  Created by Alberto Plata on 5/27/18.
//  Copyright © 2018 Alberto Plata. All rights reserved.
//

import UIKit
import LBTAComponents

class SearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var searchImageView: UIImageView!
    
    let cachedImageView = CachedImageView()
    
    var photo: Photo? {
        didSet {
            guard let photo = photo,
                let farm = photo.farm,
                let server = photo.server,
                let photoId = photo.photoId,
                let secret = photo.secret else { return }
            
            let urlString = "https://farm\(farm).staticflickr.com/\(server)/\(photoId)_\(secret).jpg"
            cachedImageView.loadImage(urlString: urlString) {
                self.searchImageView.image = self.cachedImageView.image
            }
        }
    }
    
    override func prepareForReuse() {
        
        searchImageView.image = nil
    }
}
