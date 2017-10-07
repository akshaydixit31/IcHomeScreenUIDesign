//
//  ViewController.swift
//  UIDemo
//
//  Created by Appinventiv Technologies on 06/10/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //    MARK:- Outlet's .....
    
    @IBOutlet weak var homeScreenTable: UITableView!
    
    var isClicked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNibFiles()
        
    }
    
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeScreenHeaderId") as? HomeScreenHeader else{
            
            fatalError()
        }
        
        headerView.sidePanelButton.addTarget(self,
                                             action: #selector(sidePanelButtonAction),
                                             for: UIControlEvents.touchUpInside)
        
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        switch indexPath.row {
            
        case 0:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesCellId",
                                                           for: indexPath) as? ServicesCell else {
                                                            
                                                            fatalError("Cell not found:")
                                                            
            }
            
            cell.downButtonOutlet.addTarget(self, action: #selector(doneButton),
                                            for: UIControlEvents.touchUpInside)
            
            return cell
            
        case 1:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CorporateServicesId",
                                                           for: indexPath) as? CorporateServices else{
                                                            
                                                            fatalError()
                                                            
            }
            cell.nineMoreButton.addTarget(self, action: #selector(nineMoreServiceButton),
                                          for: UIControlEvents.touchUpInside)
            
            
            return cell
            
        case 2:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingCityTourCellId",
                                                           for: indexPath) as? TrendingCityTourCell else{
                                                            
                                                            fatalError()
                                                            
            }
            cell.cellTitleLabel.text = "Trending City Tour"
            
            return cell
            
        case 3:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopRatedRestaurantsId",
                                                           for: indexPath) as? TopRatedRestaurants else{
                                                            
                                                            fatalError()
                                                            
            }
           
            return cell
            
        case 4:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopNearByEventCellId",
                                                           for: indexPath) as? TopNearByEventCell else{
                                                            
                                                            fatalError()
                                                            
            }
            
            return cell
            
        default:
            
            return cell
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
            
        case 0:
            
            if isClicked{
                
                return 360
                
            }
            else{
                
                return 180
                
            }
            
        case 1:
            
            return 180
            
        case 2:
            
            return 300
            
        case 3:
            
            return 250
            
        case 4:
            
            return 400
            
        default:
            
            return 180
            
        }
        
    }
    
    
    
}

extension ViewController {
    
    func registerNibFiles(){
        
        //--MARK:- Register Header..
        
        let headerNib = UINib(nibName: "HomeScreenHeader",
                              bundle: nil)
        self.homeScreenTable.register(headerNib,
                                      forHeaderFooterViewReuseIdentifier: "HomeScreenHeaderId")
        
        //  MARK:- Register Cell's ..
        
        let sevicesNib = UINib(nibName: "ServicesCell", bundle: nil)
        self.homeScreenTable.register(sevicesNib, forCellReuseIdentifier: "ServicesCellId")
        
        let corporateNib = UINib(nibName: "CorporateServices", bundle: nil)
        self.homeScreenTable.register(corporateNib, forCellReuseIdentifier: "CorporateServicesId")
        
        let trendingNib = UINib(nibName: "TrendingCityTourCell", bundle: nil)
        self.homeScreenTable.register(trendingNib, forCellReuseIdentifier: "TrendingCityTourCellId")
        
        let topResNib = UINib(nibName: "TopRatedRestaurants", bundle: nil)
        self.homeScreenTable.register(topResNib, forCellReuseIdentifier: "TopRatedRestaurantsId")
        
        let topRatedNib = UINib(nibName: "TopNearByEventCell", bundle: nil)
        self.homeScreenTable.register(topRatedNib, forCellReuseIdentifier: "TopNearByEventCellId")
        
        self.homeScreenTable.dataSource = self
        self.homeScreenTable.delegate = self
        
    }
    
    @objc func  sidePanelButtonAction(){
        
        NotificationCenter.default.post(name: NSNotification.Name("sideButtonTapped"),
                                        object: nil,
                                        userInfo: nil)
        
    }
    
    @objc func  doneButton(){
        
        self.isClicked = !self.isClicked
        
        let index = IndexPath.init(row: 0, section: 0)
        let cell = self.homeScreenTable.cellForRow(at: index) as? ServicesCell
        
        UIView.animate(withDuration: 0.6,
                       delay: 0, options: .curveEaseInOut,
                       animations: {
                        
                        if cell?.transform == .identity{
                            self.homeScreenTable.reloadRows(at:[index], with:.automatic)
                            cell?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                            
                        }
                        
        }, completion: { (true) in
            
            
            cell?.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        })
        
        
    }
    
    @objc func  nineMoreServiceButton(){
        
        guard let moreServiceScene = self.storyboard?.instantiateViewController(withIdentifier: "NineMoreServicesId") as? NineMoreServices else {
            
            fatalError()
            
        }
        self.navigationController?.pushViewController(moreServiceScene, animated: true)
        
    }
}

