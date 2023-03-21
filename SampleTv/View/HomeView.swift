//
//  HomeView.swift
//  SampleTv
//
//  Created by @karthi on 20/03/23.
//

import UIKit

class HomeView: BaseView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var coffeeData: CoffeeList?

    override func didLoad(baseVC: BaseViewController) {
        super.didLoad(baseVC: baseVC)
        print("Initiate View")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CofeeCollectionViewCell.getNib(), forCellWithReuseIdentifier: "CofeeCollectionViewCell")
    }
    
    public func reloadUI(_ coffee: CoffeeList) {
        self.coffeeData = coffee
        self.collectionView.reloadData()
    }

}


extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = CGFloat(350)
        let cellHeight = CGFloat(300)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coffeeData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CofeeCollectionViewCell", for: indexPath) as? CofeeCollectionViewCell
        guard let data = coffeeData?[indexPath.row] else {return UICollectionViewCell()}
        cell?.populateData(data)
        return cell ?? UICollectionViewCell()
    }
    
}
