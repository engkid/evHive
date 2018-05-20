//
//  ChatBubbleTableViewCell.swift
//  EvHive
//
//  Created by Engkit on 19/05/18.
//  Copyright © 2018 Engkit. All rights reserved.
//

import UIKit

class ChatBubbleSentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelChat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.labelChat.layer.borderWidth = CGFloat(0.5)
        self.labelChat.layer.borderColor = UIColor.blue.cgColor
        self.labelChat.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
