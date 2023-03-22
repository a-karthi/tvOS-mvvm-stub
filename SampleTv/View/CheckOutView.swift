//
//  CheckoutView.swift
//  SampleTv
//
//  Created by @karthi on 22/03/23.
//

import UIKit

class CheckoutView: BaseView {
    
    // MARK: - Variables
    
    @IBOutlet weak var checkoutTableView: UITableView!
    
    private var checkoutViewController: CheckOutViewController?
    
    private var dataSource: CoffeeList?
    
    
    // MARK: - View Life Cycle

    override func didLoad(baseVC: BaseViewController) {
        super.didLoad(baseVC: baseVC)
        self.checkoutViewController = baseVC as? CheckOutViewController
        self.checkoutTableView.delegate = self
        self.checkoutTableView.dataSource = self
    }
    
    // MARK: - IBACtion functions
    
    @IBAction func checkOutFunction(_ sender: UIButton)  {
        self.checkoutViewController?.popToRoot()
    }
    
    // MARK: - Public Function
    public func reloadUI(_ coffe: CoffeeList) {
        self.dataSource = coffe
        self.checkoutTableView.reloadData()
    }

}


extension CheckoutView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutTableViewCell") as? CheckoutTableViewCell
        guard let data = dataSource?[indexPath.row] else {return UITableViewCell()}
        cell?.populateData(data)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
