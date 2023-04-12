//
//  SigninViewController.swift
//  SampleTv
//
//  Created by @karthi on 06/04/23.
//

import Foundation
import UIKit

// MARK: - Class SigninViewController

class SigninViewController: BaseViewController {
    
    // MARK: - Variables
    
    @IBOutlet weak var signinView: SigninView!
    
    private lazy var signinViewModel: SigninViewModel? = {
        return SigninViewModel()
    }()
    
    // MARK: - View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Private Functions
    
    // MARK: - Public Functions
    
    
    // MARK: - Navigation
    
    class func initWithStory() -> SigninViewController? {
        let homeVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SigninViewController") as? SigninViewController
        return homeVc
    }
}


