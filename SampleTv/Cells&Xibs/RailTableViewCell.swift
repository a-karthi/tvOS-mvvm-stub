//
//  RailCell.swift
//  tvOSNativeSample
//
//  Created by Ragul on 26/02/23.
//


import UIKit

enum cellPurpose {
    case movies
    case music
}

protocol RailTableViewCellDidSelectProtocol {
    func didSelectMusic(_ mp3: MP3Model)
}


class RailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var railCollectionView: UICollectionView!
    
    var strs = [String]()
    
    var musicList = [MP3Model]()
    
    var purpose:cellPurpose = .movies
    
    var delegate: RailTableViewCellDidSelectProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    private func setupView() {
        railCollectionView.dataSource = self
        railCollectionView.delegate = self
        railCollectionView.register(CofeeCollectionViewCell.getNib(), forCellWithReuseIdentifier: "CofeeCollectionViewCell")
    }
    
    public func loadData(_ data: [String]) {
        self.strs = data
        self.purpose = .movies
        railCollectionView.reloadData()
    }
    
    public func loadMp3s(_ data: [MP3Model]) {
        self.musicList = data
        self.purpose = .music
        railCollectionView.reloadData()
    }
    
    override var canBecomeFocused: Bool {
        return false
    }
    
    class func getNib() -> UINib {
        return UINib(nibName: "RailTableViewCell", bundle: nil)
    }
}

extension RailTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return purpose == .movies ? strs.count : musicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CofeeCollectionViewCell", for: indexPath) as? CofeeCollectionViewCell
        switch purpose {
        case .movies:
            let str = strs[indexPath.row]
            collectionCell?.posterView.image = UIImage(named: str)
        case .music:
            let str = musicList[indexPath.row]
            collectionCell?.posterView.image = UIImage(named: str.songThumpImageName)
        }
        collectionCell?.posterView.title = nil
        collectionCell?.posterView.subtitle = nil
        collectionCell?.backgroundColor = .clear
        collectionCell?.posterView.backgroundColor = .clear
        return collectionCell ?? UICollectionViewCell()
    }
}

extension RailTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if purpose == .music {
            let str = musicList[indexPath.row]
            self.delegate?.didSelectMusic(str)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension RailTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = CGFloat(250)
        let cellHeight = CGFloat(400)
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

