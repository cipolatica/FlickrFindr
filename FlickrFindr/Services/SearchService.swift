//
//  SearchService.swift
//  FlickrFindr
//
//  Created by Alberto Plata on 5/28/18.
//  Copyright © 2018 Alberto Plata. All rights reserved.
//

import Foundation
import Alamofire
import LBTAComponents

class SearchService {
    
    func fetchPhotos(for text: String, page: Int, completion: @escaping (Photos?, Error?) -> Void) {
        
        let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=1508443e49213ff84d566777dc211f2a&page=\(page)&per_page=25&tags=\(text.replacingOccurrences(of: " ", with: ","))&format=json&nojsoncallback=1")
        
        Alamofire.request(url!).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = value as! NSDictionary
                if json["photos"] != nil {
                    completion(Photos(dict: json["photos"]! as! [String:Any]), nil)
                }
                else if json["code"] != nil {
                    completion(nil, NSError(domain:"", code:json["code"] as! Int, userInfo:nil) )
                }
                else {
                    completion(nil, NSError(domain:"", code:-1, userInfo:nil) )
                }
            case .failure(let error):
                completion(nil,error)
            }
        }
    }
}
