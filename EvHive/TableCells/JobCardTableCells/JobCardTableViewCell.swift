//
//  JobCardTableViewCell.swift
//  EvHive
//
//  Created by Engkit on 19/05/18.
//  Copyright © 2018 Engkit. All rights reserved.
//

import UIKit

class JobCardTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgImage.image = UIImage(named: "bg_office")
        self.bgImage.alpha = 0.5
        self.containerView.sendSubview(toBack: bgImage)
        self.containerView.bringSubview(toFront: icon)
        // Initialization code
    }

    internal func configureCell(index: Int) {
        if index == 0 {
            self.icon.image = UIImage(named: "ic_grab")
            self.bgImage.image = UIImage(named: "bg_office")
            self.labelName.text = "Grab - Jakarta, Indonesia"
        } else {
            self.bgImage.image = UIImage(named: "bg_office2")
            self.icon.image = UIImage(named: "ic_adidas")
            self.labelName.text = "Adidas - South Jakarta, Indonesia"
        }
    }
    
}
