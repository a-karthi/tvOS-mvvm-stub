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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.posterView.clipsToBounds = true
        self.posterView.layer.cornerRadius = 15
    }
    
    public func populateData(_ coffee: CoffeeNetworkResponse) {
        print(coffee.title)
        posterView.title = coffee.title
        posterView.subtitle = nil
    }
    
    class func getNib() -> UINib {
        return UINib(nibName: "CofeeCollectionViewCell", bundle: nil)
    }
}
