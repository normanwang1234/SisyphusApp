//
//  VideoTableViewController.swift
//  Sisyphus
//
//  Created by Norman Wang on 1/26/20.
//  Copyright © 2020 Norman Wang. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoTableViewController: UITableViewController {
    
    var videos : [Video] = Video.fetchVideos()
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.black
    }

    //Mark: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
        
        let video = videos[indexPath.row]
        cell.video = video
        cell.backgroundColor = .black
        cell.textLabel?.backgroundColor = .white
        return cell
    }
    
    //Mark: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        playVideo(at: indexPath)
    }
    

    
    func playVideo(at indexPath: IndexPath)
    {
        let selectedVideo = videos[indexPath.row]
        let videoPath = Bundle.main.path(forResource: selectedVideo.videoFileName, ofType: "mp4")
        let videoPathURL = URL(fileURLWithPath: videoPath!)
        player = AVPlayer(url: videoPathURL)
        playerViewController.player = player

        self.present(playerViewController, animated: true, completion: {
            self.playerViewController.player?.play()
        })
    }
    
}
