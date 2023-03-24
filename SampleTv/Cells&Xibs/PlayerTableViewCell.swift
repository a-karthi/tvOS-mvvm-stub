//
//  PlayerTableViewCell.swift
//  SampleTv
//
//  Created by @karthi on 24/03/23.
//

import Foundation
import UIKit
import AVKit

class PlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerView: VideoView!
    
    @IBOutlet weak var headerPoster: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    private func setupView() {
        self.headerPoster.clipsToBounds = true
        self.playerView.layer.cornerRadius = 20
        self.headerPoster.layer.cornerRadius = 20
        self.setupPlayer()
    }
    
    private func setupPlayer() {
        let videoURLString = "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"
        self.playerView.configure(url: videoURLString)
        self.playerView.isLoop = false
        self.playerView.isHidden = true

    }
    
    @IBAction func playAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.playerView.isHidden = false
            self.headerPoster.isHidden = true
            self.playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            self.playerView.play()
        } else{
            self.playerView.isHidden = true
            self.headerPoster.isHidden = false
            self.playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            self.playerView.pause()
        }
    }
    
    
    override var canBecomeFocused: Bool {
        return false
    }
    
    class func getNib() -> UINib {
        return UINib(nibName: "PlayerTableViewCell", bundle: nil)
    }
}



extension String {
    var youtubeID: String? {
        let pattern = "(?<=watch\\?v=|/videos/|embed\\/)[^#\\&\\?]*"
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: count)
        guard let result = regex?.firstMatch(in: self, range: range) else {
            return nil
        }
        return (self as NSString).substring(with: result.range)
    }
}
