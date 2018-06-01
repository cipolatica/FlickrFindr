//
//  ImageViewController.swift
//  FlickrFindr
//
//  Created by Alberto Plata on 5/30/18.
//  Copyright © 2018 Alberto Plata. All rights reserved.
//

import UIKit

/*
 ImageViewController is for displaying a selected image on a full screen.
 */
class ImageViewController: UIViewController {
    @IBOutlet weak var selectedImageView: UIImageView!
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedImage = selectedImage {
            selectedImageView.image = selectedImage
        }
    }
}
