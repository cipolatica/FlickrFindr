//
//  ErrorUtils.swift
//  FlickrFindr
//
//  Created by Alberto Plata on 5/31/18.
//  Copyright © 2018 Alberto Plata. All rights reserved.
//

import Foundation

class ErrorUtils {
    
    static let tooManyTags: Int = 1
    static let unknownUser: Int = 2
    static let parameterlessDisabled: Int = 3
    static let noPermission: Int = 4
    static let userDeleted: Int = 5
    
    static let flickrUnavailable: Int = 10
    static let noMachineTags: Int = 11
    static let exceededTags: Int = 12
    static let outOfContants: Int = 17
    static let illogicalArguments: Int = 18
    
    static let invalidAPIKey: Int = 100
    static let serviceUnavailable: Int = 105
    static let formatNotFound: Int = 111
    static let methodNotFound: Int = 112
    static let badURLFound: Int = 116
    
    static func getMessageText(for error: Error?) -> String {
        
        if let error = error as? NSError {
            switch error.code {
            case tooManyTags:
                return "Too many tags requested."
            case unknownUser:
                return "User unknown."
            case parameterlessDisabled:
                return "Parameterless searches have been disabled."
            case noPermission:
                return "No permission."
            case userDeleted:
                return "User deleted."
            case flickrUnavailable:
                return "Flickr search currently unavailable."
            case noMachineTags:
                return "No machine tags."
            case exceededTags:
                return "Exceeded maximum allowable machine tags."
            case outOfContants:
                return "Attempting to search outside of contacts."
            case illogicalArguments:
                return "Illogical arguments."
            case invalidAPIKey:
                return "Invalid API key."
            case serviceUnavailable:
                return "Service unavailable."
            case formatNotFound:
                return "Format not found."
            case methodNotFound:
                return "Method not found."
            case badURLFound:
                return "Bad URL found."
            default:
                return "Unknown error. Please try again later."
            }
        }
        return "Unknown error. Please try again later"
    }
}
