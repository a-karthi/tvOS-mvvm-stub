//
//  RailCell.swift
//  tvOSNativeSample
//
//  Created by Ragul on 26/02/23.
//


import UIKit

class RailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var railCollectionView: UICollectionView!
    
    var strs = [String]()
    
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
        return strs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CofeeCollectionViewCell", for: indexPath) as? CofeeCollectionViewCell
        let str = strs[indexPath.row]
        collectionCell?.posterView.image = UIImage(named: str)
        collectionCell?.posterView.title = nil
        collectionCell?.posterView.subtitle = nil
        collectionCell?.backgroundColor = .clear
        collectionCell?.posterView.backgroundColor = .clear
        return collectionCell ?? UICollectionViewCell()
    }
}

extension RailTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Movie Select")
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

