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
        self.ottTableView.register(PlayerTableViewCell.getNib(), forCellReuseIdentifier: "PlayerTableViewCell")
        self.ottTableView.register(OttTableHeaderView.getNib(), forHeaderFooterViewReuseIdentifier: "OttTableHeaderView")
        ottTableView.register(RailTableViewCell.getNib(), forCellReuseIdentifier: "RailTableViewCell")
    }
    
    // MARK: - IBAction Functions
    
    @IBAction func cartButtonAction(_ sender: UIButton) {
        
    }

}


// MARK: - Extension OttHomeView - TableView

extension OttHomeView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "OttTableHeaderView") as? OttTableHeaderView
        switch section {
        case 0:
            header?.populateDateCell("Trailers")
        case 1:
            header?.populateDateCell("Latest & Trending")
        case 2:
            header?.populateDateCell("Popular Movies")
        case 3:
            header?.populateDateCell("Movies from 2020's")
        default:
            header?.populateDateCell("Music")
        }
        
        return header ?? UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 450 : 350
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as? PlayerTableViewCell
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RailTableViewCell", for: indexPath) as? RailTableViewCell
            if let strs = self.ottHomeViewController?.getLatestTrendingMovies() {
                cell?.loadData(strs)
            }
            return cell ?? UITableViewCell()
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RailTableViewCell", for: indexPath) as? RailTableViewCell
            if let strs = self.ottHomeViewController?.getPopularMovies() {
                cell?.loadData(strs)
            }
            return cell ?? UITableViewCell()
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RailTableViewCell", for: indexPath) as? RailTableViewCell
            if let strs = self.ottHomeViewController?.getPopularShows() {
                cell?.loadData(strs)
            }
            return cell ?? UITableViewCell()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RailTableViewCell", for: indexPath) as? RailTableViewCell
            cell?.delegate = self
            if let mp3s = self.ottHomeViewController?.getMusicList() {
                cell?.loadMp3s(mp3s)
            }
            return cell ?? UITableViewCell()
        }
    }
}


extension OttHomeView: RailTableViewCellDidSelectProtocol {
    func didSelectMusic(_ mp3: MP3Model) {
        self.ottHomeViewController?.routeToMp3Player(mp3)
    }
}
