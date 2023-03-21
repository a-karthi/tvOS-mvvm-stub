//
//  ViewController.swift
//  SampleTv
//
//  Created by @karthi on 20/03/23.
//

import UIKit

// MARK: - Class HomeViewController

class HomeViewController: BaseViewController {
    
    // MARK: - Variables
    
    @IBOutlet weak var homeView: HomeView!
    
    private lazy var homeViewModel: HomeViewModel? = {
        return HomeViewModel()
    }()
    
    
    // MARK: - View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getCoffeeList()
    }
    
    // MARK: - Private Functions
    
    private func getCoffeeList() {
        self.homeViewModel?.getCofeeApiCall(onSuccess: { CoffeeList in
            print(CoffeeList)
            self.homeView.reloadUI(CoffeeList)
        }, onFailure: { err in
            print(err)
        })
    }
    
    // MARK: - Public Functions
    
    public func routeToCofeeDetail(_ coffee: CoffeeNetworkResponse) {
        guard let vc = DetailViewController.initWithStory(coffee) else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - Navigation
    
    class func initWithStory() -> HomeViewController? {
        let homeVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        return homeVc
    }
}

