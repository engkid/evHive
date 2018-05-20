//
//  FilterButtonView.swift
//  EvHive
//
//  Created by Engkit on 20/05/18.
//  Copyright © 2018 Engkit. All rights reserved.
//

import UIKit

class FilterButtonView: UIView {

    @IBOutlet weak var filterButtonView: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.filterButtonView.layer.cornerRadius = 15
    }

}
