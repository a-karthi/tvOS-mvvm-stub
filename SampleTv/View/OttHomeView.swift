//
//  OttHomeView.swift
//  SampleTv
//
//  Created by @karthi on 23/03/23.
//
import UIKit

// MARK: - Class OttHomeView

class OttHomeView: BaseView {
    
    // MARK: - Variables
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var topSegment: UISegmentedControl!
    
    @IBOutlet weak var searchField: UITextField!
    
    @IBOutlet weak var ottTableView: UITableView!
    
    @IBOutlet weak var tableHeaderView: UIView!
    
    @IBOutlet weak var headerPoster: UIImageView!
    
    private var ottHomeViewController: OttHomeViewControler?
    
    
    // MARK: - View Life Cycle

    override func didLoad(baseVC: BaseViewController) {
        super.didLoad(baseVC: baseVC)
        self.ottHomeViewController = baseVC as? OttHomeViewControler
        self.reloadUI()
        
    }
    
    // MARK: - Public Functions
    
    public func reloadUI() {
        self.ottTableView.delegate = self
        self.ottTableView.dataSource = self
        self.ottTableView.register(OttTableHeaderView.getNib(), forHeaderFooterViewReuseIdentifier: "OttTableHeaderView")
        self.headerPoster.clipsToBounds = true
        self.headerPoster.layer.cornerRadius = 20
        ottTableView.register(RailTableViewCell.getNib(), forCellReuseIdentifier: "RailTableViewCell")
    }
    
    // MARK: - IBAction Functions
    
    @IBAction func cartButtonAction(_ sender: UIButton) {
        
    }

}


// MARK: - Extension OttHomeView - TableView

extension OttHomeView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "OttTableHeaderView") as? OttTableHeaderView
        switch section {
        case 0:
            header?.populateDateCell("Latest & Trending")
        case 1:
            header?.populateDateCell("Popular Movies")
        default:
            header?.populateDateCell("Movies from 2020's")
        }
        
        return header ?? UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RailTableViewCell", for: indexPath) as? RailTableViewCell
        switch indexPath.section {
        case 0:
            if let strs = self.ottHomeViewController?.getLatestTrendingMovies() {
                cell?.loadData(strs)
            }
        case 1:
            if let strs = self.ottHomeViewController?.getPopularMovies() {
                cell?.loadData(strs)
            }
        default:
            if let strs = self.ottHomeViewController?.getPopularShows() {
                cell?.loadData(strs)
            }
        }
        
        return cell ?? UITableViewCell()
    }
}
