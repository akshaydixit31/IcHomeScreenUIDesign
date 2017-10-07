//
//  TrendingCityTourCell.swift
//  UIDemo
//
//  Created by Appinventiv Technologies on 07/10/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class TrendingCityTourCell: UITableViewCell {
    
    //    MARK:- Outlet's ....
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var hotelCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    //    MARK:- Variable's ....
    
    let hotelDetail = HotelDetails()
    var currentIndex = 0
    var maxLimit = 0
    var minLimit = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.pageController.numberOfPages = hotelDetail.hotel.count
        maxLimit = hotelDetail.hotel.count
        //  Register Nib for collection cell..
        
        let cellNib = UINib(nibName: "HotelDataCollectionCell",
                            bundle: nil)
        self.hotelCollectionView.register(cellNib,
                                          forCellWithReuseIdentifier: "HotelDataCollectionCellId")
        
        self.hotelCollectionView.dataSource = self
        self.hotelCollectionView.delegate = self
        
    }
    
    @IBAction func pageControllerAction(_ sender: UIPageControl) {
        
        if currentIndex < maxLimit && sender.currentPage > currentIndex {
            currentIndex =  currentIndex + 1
            
            
            self.hotelCollectionView.scrollToItem(at:IndexPath(item: self.currentIndex,
                                                               section: 0) ,
                                                  at: .right,
                                                  animated: true)
            
            
        }
        
    }
    
}
extension TrendingCityTourCell: UICollectionViewDataSource,
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
        width = width - 50
        
        return CGSize(width: width, height: 250)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didEndDisplaying cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath)
    {
        
        if let cell = collectionView.visibleCells.first {
            
            let index = collectionView.indexPath(for: cell)!
            self.pageController.currentPage = index.row
            
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        self.hotelCollectionView.reloadData()
        
        
    }
    
    
    
    
}
