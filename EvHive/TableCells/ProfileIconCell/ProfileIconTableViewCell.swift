//
//  ProfileIconTableViewCell.swift
//  EvHive
//
//  Created by Engkit on 20/05/18.
//  Copyright © 2018 Engkit. All rights reserved.
//

import UIKit

class ProfileIconTableViewCell: UITableViewCell {

    @IBOutlet weak var profileview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileview.layer.cornerRadius = 25
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
