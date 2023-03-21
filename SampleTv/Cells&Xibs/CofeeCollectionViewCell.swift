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
        self.posterView.contentMode = .scaleAspectFit
    }
    
    public func populateData(_ coffee: CoffeeNetworkResponse) {
        print(coffee.title)
        posterView.title = coffee.title
        posterView.subtitle = nil
        if let url = URL(string: coffee.image) {
            self.downloadImage(from: url) { image in
                self.posterView.image = image
            }
        }
    }
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(UIImage(data: data))
            }
        }.resume()
    }
    
    class func getNib() -> UINib {
        return UINib(nibName: "CofeeCollectionViewCell", bundle: nil)
    }
}
