//
//  TabbarController.swift
//  Trailer Zone
//
//  Created by ericzero on 4/19/23.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setVC()
    }
    
    func setVC(){
        let home = UINavigationController(rootViewController: HomeViewController())
        let upcoming = UINavigationController(rootViewController: UpcomingViewController())
        let search = UINavigationController(rootViewController: SearchViewController())
        let download = UINavigationController(rootViewController: DownloadViewController())
        
        //home.tabBarItem.selectedImage = UIImage(named: "home.selected")
        home.tabBarItem.image = UIImage(named: "home.selected")
        upcoming.tabBarItem.image = UIImage(named: "play")
        search.tabBarItem.image = UIImage(named: "search")
        download.tabBarItem.image = UIImage(named: "download")
        
        home.title = "Home"
        upcoming.title = "Coming Soon"
        search.title = "Search"
        download.title = "Downloads"
        
        tabBar.tintColor = .label
        
        setViewControllers([home, upcoming, search, download], animated: true)
    }

}
