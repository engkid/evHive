//
//  FilterViewController.swift
//  EvHive
//
//  Created by Engkit on 20/05/18.
//  Copyright © 2018 Engkit. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "showHomeViewController", sender: self)
    }

}
