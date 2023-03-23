//
//  OttTableHeaderView.swift
//  SampleTv
//
//  Created by @karthi on 23/03/23.
//

import Foundation
import UIKit

class OttTableHeaderView: UITableViewHeaderFooterView {

    // MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var seeMoreButton: UIButton!
    
    @IBOutlet weak var containerView: UIView!
    

    // MARK: - LayoutSubviews
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.layer.cornerRadius = 25
    }
    
    // MARK: - Public functions
    public func populateDateCell(_ name:String) {
        self.nameLabel.text = name
    }
    
    class func getNib() -> UINib {
        return UINib(nibName: "OttTableHeaderView", bundle: nil)
    }
}
