//
//  ContainerView.swift
//  UIDemo
//
//  Created by Appinventiv Technologies on 06/10/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ContainerView: UIViewController {
    
    //    MARK:- Outlet's ..
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var sidePanelView: UIView!
    
    //    MARK:- ViewDidLoad ..
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName:NSNotification.Name("sideButtonTapped"),
                                               object: nil,
                                               queue: OperationQueue.main,
                                               using: {(notification) in
                                                
                                                UIView.animate(withDuration: 0.5, animations: {
                                                    
                                                    self.sidePanelView.transform = CGAffineTransform(translationX: 224, y: 0)
                                                    
                                                })
        })
        
        // ---------- For return ------
        NotificationCenter.default.addObserver(forName:NSNotification.Name("sideButtonTappedInReturn"),
                                               object: nil,
                                               queue: OperationQueue.main,
                                               using: {(notification) in
                                                
                                                UIView.animate(withDuration: 0.5, animations: {
                                                    
                                                    self.sidePanelView.transform = CGAffineTransform(translationX: -224, y: 0)
                                                    
                                                })
        })
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.sidePanelView.transform = CGAffineTransform(translationX: -224, y: 0)
            
        })
        
    }
    
    
    
}
