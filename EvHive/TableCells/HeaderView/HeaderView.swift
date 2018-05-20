//
//  HeaderView.swift
//  EvHive
//
//  Created by Engkit on 20/05/18.
//  Copyright © 2018 Engkit. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureView(_ index: Int) {
        
        switch(index) {
        case 0: return (self.titleLabel?.text = "Sort By")!
        case 1: return (self.titleLabel?.text = "Date Posted")!
        case 2: return (self.titleLabel?.text = "Company")!
        case 3: return (self.titleLabel?.text = "Experience Level")!
        case 4: return (self.titleLabel?.text = "Job Type")!
        case 5: return (self.titleLabel?.text = "Industry")!
        case 6: return (self.titleLabel?.text = "Job Function")!
        case 7: return (self.titleLabel?.text = "Company Tier")!
        default: return (self.titleLabel?.text = "")!
        }
        
    }

}
