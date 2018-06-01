//
//  Photo.swift
//  FlickrFindr
//
//  Created by Alberto Plata on 5/31/18.
//  Copyright © 2018 Alberto Plata. All rights reserved.
//

import Foundation

/*
 Photo model conforming to Flickr's flickr.photos.search API.
 */
class Photo {
    
    let farm: Int?
    let photoId: String?
    let isfamily: Int?
    let isfriend: Int?
    let ispublic: Int?
    let owner: String?
    let secret: String?
    let server: String?
    let title: String?
    
    init(dict: [String: Any]) {
        
        farm = dict["farm"] as? Int
        photoId = dict["id"] as? String
        isfamily = dict["isfamily"] as? Int
        isfriend = dict["isfriend"] as? Int
        ispublic = dict["ispublic"] as? Int
        owner = dict["owner"] as? String
        secret = dict["secret"] as? String
        server = dict["server"] as? String
        title = dict["title"] as? String
    }
}
