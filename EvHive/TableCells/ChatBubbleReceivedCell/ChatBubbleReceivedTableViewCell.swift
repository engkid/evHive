//
//  ChatBubbleReceivedTableViewCell.swift
//  EvHive
//
//  Created by Engkit on 19/05/18.
//  Copyright © 2018 Engkit. All rights reserved.
//

import UIKit

class ChatBubbleReceivedTableViewCell: UITableViewCell {

    @IBOutlet weak var labelChat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.labelChat.layer.cornerRadius = 5
        self.labelChat.layer.borderWidth = CGFloat(0.5)
        self.labelChat.layer.borderColor = UIColor.gray.cgColor
        // Initialization code
    }
    
}
