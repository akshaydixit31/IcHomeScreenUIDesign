//
//  ServicesCell.swift
//  UIDemo
//
//  Created by Appinventiv Technologies on 06/10/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ServicesCell: UITableViewCell {
    
    //    MARK:- Outlet's..
    
    @IBOutlet weak var downButtonOutlet: UIButton!
    @IBOutlet weak var serviceCollectionView: UICollectionView!
    
    
    //    MARK:- Variable's..
    
    let seviceData = Services()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let cellNib = UINib(nibName: "ServiceCollectionViewCell",
                            bundle: nil)
        self.serviceCollectionView.register(cellNib,
                                            forCellWithReuseIdentifier: "ServiceCollectionViewCellId")
        
        self.serviceCollectionView.dataSource = self
        self.serviceCollectionView.delegate = self
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}

extension ServicesCell: UICollectionViewDataSource,
    UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return self.seviceData.serviceName.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCollectionViewCellId",
                                                            for: indexPath) as? ServiceCollectionViewCell else{
                                                                
                                                                fatalError()
                                                                
        }
        
        cell.serviceImage.image = UIImage(named: self.seviceData.serviceImage[indexPath.row])
        cell.serviceNameLabel.text = self.seviceData.serviceName[indexPath.row]
        
        let maxSize = CGSize(width: 75, height: 16)
        let size = cell.serviceNameLabel.sizeThatFits(maxSize)
        cell.serviceNameLabel.frame = CGRect(origin: CGPoint(x: 0, y: 60), size: size)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width = UIScreen.main.bounds.width
        width = width/4 - 24
        
        return CGSize(width: width, height: 130)
        
    }
    
    
    
    
    
}
