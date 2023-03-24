//
//  OttHomeViewControler.swift
//  SampleTv
//
//  Created by @karthi on 23/03/23.
//
import UIKit

// MARK: - Class HomeViewController

class OttHomeViewControler: BaseViewController {
    
    // MARK: - Variables
    
    @IBOutlet weak var ottHomeView: OttHomeView!
    
    private lazy var ottHomeViewModel: OttHomeViewModel? = {
        return OttHomeViewModel()
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
    
    public func routeToMp3Player(_ mp3: MP3Model) {
        guard let vc = MP3PlayerViewController.initWithStory(mp3) else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    public func getLatestTrendingMovies() -> [String]?{
        self.ottHomeViewModel?.trendingMovies
    }
    
    public func getPopularMovies() -> [String]?{
        self.ottHomeViewModel?.popularMovies
    }
    
    public func getPopularShows() -> [String]?{
        self.ottHomeViewModel?.popularShows
    }
    
    public func getMusicList() -> [MP3Model]?{
        self.ottHomeViewModel?.mp3List
    }
    
    
    // MARK: - Navigation
    
    class func initWithStory() -> OttHomeViewControler? {
        let homeVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OttHomeViewControler") as? OttHomeViewControler
        return homeVc
    }
}

