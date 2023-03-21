//
//  DetailViewController.swift
//  SampleTv
//
//  Created by @karthi on 21/03/23.
//

import UIKit

// MARK: - Class DetailViewController

class DetailViewController: UIViewController {

    // MARK: - Variables
    
    @IBOutlet weak var detailView: DetailView!
    
    private lazy var detailViewModel: DetailViewModel? = {
        return DetailViewModel()
    }()
    
    
    // MARK: - View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadUI()
    }
    
    // MARK: - Private Functions
    
    private func loadUI() {
        if let cof = self.detailViewModel?.getSelectedCoffee() {
            self.detailView.reloadUI(cof)
        }
    }


    
    // MARK: - Navigation

    class func initWithStory(_ coffee: CoffeeNetworkResponse) -> DetailViewController? {
        let homeVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        homeVc?.detailViewModel?.setSelectedCoffeeData(coffee)
        return homeVc
    }

}
