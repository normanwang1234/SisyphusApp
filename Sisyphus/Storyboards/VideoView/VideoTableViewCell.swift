//
//  VideoTableViewCell.swift
//  Sisyphus
//
//  Created by Norman Wang on 1/26/20.
//  Copyright © 2020 Norman Wang. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbNailImage : UIImageView!
    
    @IBOutlet weak var videoLabel : UILabel!
    
    var video: Video! {
        didSet{
            updateUI()
        }
    }
    func updateUI(){
        thumbNailImage.image = UIImage(named: video.thumbnailFileName)
        thumbNailImage.layer.cornerRadius = 10.0
        thumbNailImage.layer.masksToBounds = true
        videoLabel.text = video.videoFileName
    
    }
    
}
