//
//  CustomCartCell.swift
//  iOS_ShoppingApp_Exercise
//
//  Created by Brendan Castro on 10/17/16.
//  Copyright © 2016 WellsFargoMobileInnovations. All rights reserved.
//

import UIKit

protocol CustomCellDelegate {
    func updateCartValueButtonPressed(_ cell: CustomCartCell)
}

class CustomCartCell: UITableViewCell {
    
    var delegate: CustomCellDelegate?
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var updateCartValueButton: UIButton!
    @IBOutlet weak var productNameLabel: UILabel!
    
    let attributes = [NSAttributedString.Key.font: UIFont.ioniconFontOfSize(30)] as Dictionary?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if (reuseIdentifier == "cartCell")
        {
            updateCartValueButton.setImage(UIImage.imageWithIonicon(.CheckmarkCircled, color: UIColor.black, iconSize: 40, imageSize: CGSize(width: 40, height: 40)), for: .normal)
            updateCartValueButton.sizeToFit()
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
