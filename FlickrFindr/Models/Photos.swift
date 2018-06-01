//
//  Photos.swift
//  FlickrFindr
//
//  Created by Alberto Plata on 5/31/18.
//  Copyright © 2018 Alberto Plata. All rights reserved.
//

import Foundation

class Photos {
    
    let page: Int?
    let pages: Int?
    let perpage: Int?
    var photo: [Photo]?
    let total: String?
    
    init(dict: [String: Any]) {
        
        page = dict["page"] as? Int
        pages = dict["pages"] as? Int
        perpage = dict["perpage"] as? Int
        photo = nil
        if let photoArray = dict["photo"] as? NSArray {
            var temp = [Photo]()
            for eachPhoto in photoArray {
                temp.append(Photo(dict: eachPhoto as! [String: Any]))
            }
            self.photo = temp
        }
        total = dict["total"] as? String
    }
}
