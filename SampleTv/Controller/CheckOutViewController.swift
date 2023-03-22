//
//  CheckOutViewController.swift
//  SampleTv
//
//  Created by @karthi on 22/03/23.
//

import UIKit

// MARK: - Class CheckOutViewController

class CheckOutViewController: BaseViewController {

    // MARK: - Variables
    
    @IBOutlet weak var checkOutView: CheckoutView!
    
    private var coffeeList: CoffeeList?
    
    // MARK: - View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadUI()
    }
    
    // MARK: - Private Functions
    
    private func loadUI() {
        if let cof = coffeeList {
            self.checkOutView.reloadUI(cof)
        }
    }
    
    // MARK: - Public Functions
    
    public func popToRoot() {
        self.navigationController?.popViewController(animated: true)
    }


    
    // MARK: - Navigation

    class func initWithStory(_ coffee: CoffeeList) -> CheckOutViewController? {
        let homeVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CheckOutViewController") as? CheckOutViewController
        homeVc?.coffeeList = coffee
        return homeVc
    }

}
