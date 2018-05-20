//
//  FilterViewController.swift
//  EvHive
//
//  Created by Engkit on 20/05/18.
//  Copyright © 2018 Engkit. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let tableSectionsArray = [0,1,1,2,1,1,1,1]
    let nib = UINib(nibName: "FilterButtonView", bundle: Bundle.main)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfiguration()
    }
    
    fileprivate func tableViewConfiguration(){
        guard let view = (self.nib.instantiate(withOwner: self, options: nil).first as? UIView) as? FilterButtonView else {
            return
        }
        
        self.tableView.register(UINib(nibName: "FilterTypeTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "FilterTypeTableViewCell")
        self.tableView.register(UINib(nibName: "ExperienceBarTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ExperienceBarTableViewCell")
        self.tableView.register(UINib(nibName: "FilterSortTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "FilterSortTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.tableFooterView = view
    }
    
    fileprivate func filterSortCell(_ tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSortTableViewCell") as? FilterSortTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    fileprivate func filterExpBarCell(_ tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceBarTableViewCell") as? ExperienceBarTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    fileprivate func filterTypeCell(_ tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTypeTableViewCell") as? FilterTypeTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "showHomeViewController", sender: self)
    }
    
    //MARK TABLEVIEWDATASOURCE AND DELEGATE
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableSection = self.tableSectionsArray[indexPath.section]
        
        switch(tableSection) {
        case 0: return filterSortCell(tableView)
        case 1: return filterTypeCell(tableView)
        case 2: return filterExpBarCell(tableView)
        default: return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableSectionsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableSection = self.tableSectionsArray[indexPath.section]
        
        switch(tableSection) {
        case 0: return CGFloat(44)
        case 1: return CGFloat(44)
        case 2: return CGFloat(78)
        default: return CGFloat(0)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nib = UINib(nibName: "HeaderView", bundle: Bundle.main)

        guard let view = (nib.instantiate(withOwner: self, options: nil).first as? UIView) as? HeaderView else {
            return nil
        }
        
        view.configureView(section)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.tableSectionsArray[section] == 0 {
            return 2
        }

        return 1
    }

}
