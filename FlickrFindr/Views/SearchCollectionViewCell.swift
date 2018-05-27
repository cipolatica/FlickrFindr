//
//  SearchCollectionViewCell.swift
//  FlickrFindr
//
//  Created by Alberto Plata on 5/27/18.
//  Copyright © 2018 Alberto Plata. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var searchImageView: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    private func commonInit() {
        
    }

}
