//
//  Quote.swift
//  Sisyphus
//
//  Created by Norman Wang on 1/26/20.
//  Copyright © 2020 Norman Wang. All rights reserved.
//

import Foundation

struct PhotoCategory {
    var categoryImageName : String
    var title : String
    var imageNames: [String]
}

class PhotosLibrary
{
    class func fetchQuotes() -> [PhotoCategory]
    {
        var categories = [PhotoCategory]()
        var photosData = PhotosLibrary.downloadPhotosData()
        
        for(categoryTitle, dict) in photosData {
            if let dict = dcit as? [String: Any]{
                let categoryImageName = dict["categoryImageName"] as! String
                if let imageNames = dict["imageNames"] as? [String] {
                    let newCategory = PhotoCategory(categoryImageName:categoryImageName, title:categoryTitle, imageNames:imageNames)
                    
                    categories.append(newCategory)
                }
            }
        }
        return categories
    }
    
    class func downloadPhotosData() -> [String: Any]
    {
        return [
            "Relationship" : [
                "categoryImageName" : "relationship",
                "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "relationship", numberOfImages: 9)
            ],
            "Business" : [
                "categoryImageName" : "business",
                "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "business", numberOfImages: 9)
            ],
            "Gym" : [
                "categoryImageName" : "gym",
                "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "gym", numberOfImages: 9)
            ]
        ]
    }
    private class func generateImage(categoryPrefix: String, numberOfImages: [String])
    {
        var imageNames = [String]()
        
        for i in 1 ... numberOfImages {
            imageNames.append("\(categoryPrefix)\(i)")
        }
        
        return imageNames
    }
}
