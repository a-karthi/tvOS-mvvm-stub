//
//  CheckoutTableViewCell.swift
//  SampleTv
//
//  Created by @karthi on 22/03/23.
//

import UIKit

class CheckoutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coffeImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.coffeImage.clipsToBounds = true
        self.coffeImage.layer.cornerRadius = 20
    }
    
    public func populateData(_ coffee: CoffeeNetworkResponse) {
        print(coffee.title)
        self.nameLabel.text = coffee.title
        self.priceLabel.text = "$25"
        if let url = URL(string: coffee.image) {
            ImageDownloader.downloadImage(from: url) { image in
                self.coffeImage.image = image
            }
        }
    }
    
    class func getNib() -> UINib {
        return UINib(nibName: "CofeeCollectionViewCell", bundle: nil)
    }
}
