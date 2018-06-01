//
//  ImageViewController.swift
//  FlickrFindr
//
//  Created by Alberto Plata on 5/30/18.
//  Copyright © 2018 Alberto Plata. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var selectedImageView: UIImageView!
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedImage = selectedImage {
            selectedImageView.image = selectedImage
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
