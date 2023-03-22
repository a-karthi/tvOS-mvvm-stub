//
//  HomeView.swift
//  SampleTv
//
//  Created by @karthi on 20/03/23.
//

import UIKit

// MARK: - Class HomeView

class HomeView: BaseView {
    
    // MARK: - Variables
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var cartButton: UIButton!
    
    private var homeViewController: HomeViewController?
    
    
    // MARK: - View Life Cycle

    override func didLoad(baseVC: BaseViewController) {
        super.didLoad(baseVC: baseVC)
        self.homeViewController = baseVC as? HomeViewController
        print("Initiate View")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CofeeCollectionViewCell.getNib(), forCellWithReuseIdentifier: "CofeeCollectionViewCell")
    }
    
    // MARK: - Public Functions
    
    public func reloadUI(_ coffee: CoffeeList) {
        self.collectionView.reloadData()
    }
    
    public func changeCartButtonUI(_ color: UIColor) {
        self.cartButton.backgroundColor = color
    }
    
    // MARK: - IBAction Functions
    
    @IBAction func cartButtonAction(_ sender: UIButton) {
        self.homeViewController?.routeToChekOutScreen()
    }

}


// MARK: - Extension HomeView - CollectionView

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = CGFloat(350)
        let cellHeight = CGFloat(300)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SharedCoffeList.shared.coffeeList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CofeeCollectionViewCell", for: indexPath) as? CofeeCollectionViewCell
        guard let data = SharedCoffeList.shared.coffeeList?[indexPath.row] else {return UICollectionViewCell()}
        cell?.populateData(data)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let data = SharedCoffeList.shared.coffeeList?[indexPath.row] else {return}
        self.homeViewController?.routeToCofeeDetail(data)
    }
    
}
