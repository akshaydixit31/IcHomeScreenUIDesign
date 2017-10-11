//
//  TopInsuranceSeller.swift
//  UIDemo
//
//  Created by Appinventiv Technologies on 09/10/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class TopInsuranceSeller: UITableViewCell {
    
    //    MARK:- Outlet's..
    
    @IBOutlet weak var topInsuranceCollection: UICollectionView!
    
    //    MARK:- Variable's..
    
    let insuranceData = TopInsurance()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let insuranceNib = UINib(nibName: "ServiceCollectionViewCell",
                                 bundle: nil)
        self.topInsuranceCollection.register(insuranceNib,
                                             forCellWithReuseIdentifier: "ServiceCollectionViewCellId")
        self.topInsuranceCollection.dataSource = self
        self.topInsuranceCollection.delegate = self
        
    }
    
}

extension TopInsuranceSeller: UICollectionViewDataSource,
    UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return self.insuranceData.insuranceTitle.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCollectionViewCellId",
                                                            for: indexPath) as? ServiceCollectionViewCell else {
                                                                
                                                                fatalError()
        }
        
        cell.serviceImage.image = UIImage(named: self.insuranceData.insuranceImage[indexPath.row])
        cell.serviceNameLabel.text = self.insuranceData.insuranceTitle[indexPath.row]
        cell.serviceNameLabel.textColor = UIColor.black
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width = UIScreen.main.bounds.width
        width = width/3 - 20
        
        return CGSize(width: width, height: 130)
        
    }
    
    
}
