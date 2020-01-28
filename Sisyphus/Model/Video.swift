//
//  Video.swift
//  Sisyphus
//
//  Created by Norman Wang on 1/26/20.
//  Copyright © 2020 Norman Wang. All rights reserved.
//

import Foundation

struct Video
{
    let videoFileName: String
    let thumbnailFileName: String
    
    static func fetchVideos() -> [Video]
    {
        let v1 = Video(videoFileName: "Unbroken", thumbnailFileName: "video1")
        let v2 = Video(videoFileName: "Failure", thumbnailFileName: "video2")
        let v3 = Video(videoFileName: "Dream", thumbnailFileName: "video3")
        let v4 = Video(videoFileName: "Contenders", thumbnailFileName: "video4")
        let v5 = Video(videoFileName: "No Excuses", thumbnailFileName: "video5")
        
        return [v1, v2, v3, v4, v5]

    }
    
}
