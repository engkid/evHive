//
//  OptionViewController.swift
//  EvHive
//
//  Created by Engkit on 20/05/18.
//  Copyright © 2018 Engkit. All rights reserved.
//

import UIKit

class OptionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
