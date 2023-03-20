//
//  ViewController.swift
//  SampleTv
//
//  Created by @karthi on 20/03/23.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var homeView: HomeView!
    
    private var homeViewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getCoffeeList()
    }
    
    private func getCoffeeList() {
        self.homeViewModel?.getCofeeApiCall(onSuccess: { CoffeeList in
            print(CoffeeList)
            self.homeView.reloadUI(CoffeeList)
        }, onFailure: { err in
            print(err)
        })
    }
    
    class func initWithStory() -> HomeViewController? {
        let homeVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        homeVc?.homeViewModel = HomeViewModel()
        return homeVc
    }
}

