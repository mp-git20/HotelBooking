//
//  HotelTableViewCell.swift
//  Hotel
//
//  Created by APPDEV on 12/09/20.
//  Copyright © 2020 APPDEV. All rights reserved.
//

import UIKit
import SDWebImage

class HotelTableViewCell: UITableViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet var type: UILabel!
    @IBOutlet var cost: UILabel!
    @IBOutlet var imageVw: UIImageView!
    @IBOutlet var dealBtn: UIButton!
    @IBOutlet var bottomVw: UIView!
    static let cellidentifier = "HotelTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        imageVw.layer.cornerRadius = 5.0
        bottomVw.layer.cornerRadius = 5.0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "HotelTableViewCell", bundle: nil)
    }
    
    public func configure(with viewModel:CellViewModel){
        name.text = viewModel.hotelName
        type.text = viewModel.type
        cost.text = viewModel.cost
        imageVw.sd_setImage(with: URL(string:viewModel.image), placeholderImage: UIImage(named: ""))
        
    }
    
}
