//
//  CorporateServices.swift
//  UIDemo
//
//  Created by Appinventiv Technologies on 06/10/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class CorporateServices: UITableViewCell {
    
    //    MARK:- Outlet's..
    
    @IBOutlet weak var corporateCollectionView: UICollectionView!
    @IBOutlet weak var nineMoreButton: UIButton!
    
    let corporateData = CorporateServicesModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //        Register CollectionCell..
        
        let cellNib = UINib(nibName: "ServiceCollectionViewCell", bundle: nil)
        self.corporateCollectionView.register(cellNib,
                                              forCellWithReuseIdentifier: "ServiceCollectionViewCellId")
        
        self.corporateCollectionView.dataSource = self
        self.corporateCollectionView.delegate = self
        
    }
    
}

extension CorporateServices: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.corporateData.corporateServiceName.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCollectionViewCellId",
                                                            for: indexPath) as? ServiceCollectionViewCell else {
                                                                
                                                                fatalError()
                                                                
        }
        
        cell.serviceImage.image = UIImage(named: self.corporateData.corporateServiceImage[indexPath.row])
        cell.serviceNameLabel.text = self.corporateData.corporateServiceName[indexPath.row]
        cell.serviceNameLabel.font = UIFont.boldSystemFont(ofSize: 13)
        cell.serviceNameLabel.textColor = UIColor.black
        cell.serviceNameLabel.numberOfLines = 1
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width = UIScreen.main.bounds.width
        width = width/3 - 10
        
        return CGSize(width: width, height: 100)
        
    }
    
}
