//
//  CofeeCollectionViewCell.swift
//  SampleTv
//
//  Created by @karthi on 20/03/23.
//

import UIKit
import TVUIKit

class CofeeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterView: TVPosterView!
    
    // MARK: - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public func populateData(_ coffee: CoffeeNetworkResponse) {
        print(coffee.title)
        posterView.title = coffee.title
    }
    
    class func getNib() -> UINib {
        return UINib(nibName: "CofeeCollectionViewCell", bundle: nil)
    }
}
