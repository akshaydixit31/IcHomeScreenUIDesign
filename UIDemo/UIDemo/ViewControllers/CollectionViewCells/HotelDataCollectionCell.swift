//
//  HotelDataCollectionCell.swift
//  UIDemo
//
//  Created by Appinventiv Technologies on 07/10/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class HotelDataCollectionCell: UICollectionViewCell {

    @IBOutlet weak var hotelImage: UIImageView!
    @IBOutlet weak var hotelNameLabel: UILabel!
    @IBOutlet weak var priceDetailLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
