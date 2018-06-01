//
//  UIViewController+Utils.swift
//  FlickrFindr
//
//  Created by Alberto Plata on 5/31/18.
//  Copyright © 2018 Alberto Plata. All rights reserved.
//

import UIKit

/*
 UIViewController extension.
 */
extension UIViewController {
    
    /*
     This method is used for UIViewControllers to display error messages.
     */
    func showError(_ error: Error?, completion: ((UIAlertAction) -> Void)?){
        
        let alert = UIAlertController(title: "Error", message: ErrorUtils.getMessageText(for: error), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: completion))
        self.present(alert, animated: true, completion: nil)
    }
}
