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
        
        return 1
        
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
            
            cell.downButtonOutlet.addTarget(self, action: #selector(doneButton), for: UIControlEvents.touchUpInside)
            
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
            
        default:
            
            return 100
            
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
        self.homeScreenTable.reloadData()
        
    }
}

