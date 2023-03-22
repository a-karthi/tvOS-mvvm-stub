//
//  DetailView.swift
//  SampleTv
//
//  Created by @karthi on 21/03/23.
//

import Foundation
import UIKit

// MARK: - Class DetailView

class DetailView: BaseView {
    
    // MARK: - Variables
    @IBOutlet weak var coffeeImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionCofee: UITextView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var addToCartButton: UIButton!
    
    private var detailViewController: DetailViewController?
    
    private var coffee: CoffeeNetworkResponse?
    
    
    // MARK: - View Life Cycle

    override func didLoad(baseVC: BaseViewController) {
        super.didLoad(baseVC: baseVC)
        self.detailViewController = baseVC as? DetailViewController
        self.descriptionCofee.isUserInteractionEnabled = false
        self.coffeeImage.layer.cornerRadius = 50
        self.coffeeImage.clipsToBounds = true
    }
    
    // MARK: - IBACtion functions
    
    @IBAction func addToCartFunction(_ sender: UIButton)  {
        if let coffee = self.coffee {
            coffee.isInCart = !coffee.isInCart
        }
        self.detailViewController?.popToRoot()
    }
    
    // MARK: - Public Function
    public func reloadUI(_ coffe: CoffeeNetworkResponse) {
        if let url = URL(string: coffe.image) {
            ImageDownloader.downloadImage(from: url) { img in
                self.coffeeImage.image = img
            }
        }
        self.coffee = coffe
        self.titleLabel.text = coffe.title
        if let cof = self.coffee {
            let title = coffe.isInCart ? "Remove from cart" : "Add to cart"
            self.addToCartButton.setTitle(title, for: .normal)
        }
        let ingredientsString = coffe.ingredients.joined(separator: ", ")
        self.descriptionCofee.text = coffe.description + "\nIngredients - \(ingredientsString)"
    }

}


