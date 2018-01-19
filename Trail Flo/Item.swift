//
//  Item.swift
//  Trail Flo
//
//  Created by Nikhil Manapure on 19/01/18.
//
//

import UIKit

class Item {
    
    public var collectionId : Int?
    public var resCount : Int?
    public var imageUrl : String?
    public var url : String?
    public var title : String?
    public var description : String?
    public var shareUrl : String?
    
    public class func models(from array: [[String: Any]]) -> [Item] {
        var models:[Item] = []
        for rawItem in array {
            if let item = Item(raw: rawItem) {
                models.append(item)
            }
        }
        return models
    }
    
    required public init?(raw: [String: Any]) {
        collectionId = raw["collection_id"] as? Int
        resCount = raw["res_count"] as? Int
        imageUrl = raw["image_url"] as? String
        url = raw["url"] as? String
        title = raw["title"] as? String
        description = raw["description"] as? String
        shareUrl = raw["share_url"] as? String
    }
}
