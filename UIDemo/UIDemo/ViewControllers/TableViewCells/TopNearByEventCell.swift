//
//  TopNearByEventCell.swift
//  UIDemo
//
//  Created by Appinventiv Technologies on 07/10/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class TopNearByEventCell: UITableViewCell {
    
    @IBOutlet weak var topEventCollectionView: UICollectionView!
    @IBOutlet weak var twoMoreButton: UIButton!
    let hotelDetail = HotelDetails()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let cellNib = UINib(nibName: "HotelDataCollectionCell",
                            bundle: nil)
        self.topEventCollectionView.register(cellNib,
                                             forCellWithReuseIdentifier: "HotelDataCollectionCellId")
        
        self.topEventCollectionView.dataSource = self
        self.topEventCollectionView.delegate = self
    }
    
    
    
    
}

extension TopNearByEventCell: UICollectionViewDataSource,
    UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return self.hotelDetail.hotel.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotelDataCollectionCellId",
                                                            for: indexPath) as? HotelDataCollectionCell else {
                                                                
                                                                fatalError()
        }
        
        cell.hotelNameLabel.text = self.hotelDetail.hotel[indexPath.row]
        cell.hotelImage.image = UIImage(named: self.hotelDetail.hotel[indexPath.row])
        cell.priceDetailLabel.text = self.hotelDetail.price[indexPath.row]
        cell.descriptionLabel.text = self.hotelDetail.descrip[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width = UIScreen.main.bounds.width
        width = width / 2 - 15
        
        return CGSize(width: width, height: 200)
        
    }
}
