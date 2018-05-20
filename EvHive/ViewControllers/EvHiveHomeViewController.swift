//
//  ViewController.swift
//  EvHive
//
//  Created by Engkit on 19/05/18.
//  Copyright © 2018 Engkit. All rights reserved.
//

import UIKit

enum tableSections: Int {
    
    case none = -1
    case profileIconCell = 0
    case chatReceived = 1
    case chatSent = 2
    case jobCategory = 3
    case jobCard = 4
    case searchingJobs = 5
    
    static func tableSectionFromInt(_ section: Int) -> tableSections {
        let optionalSection = tableSections(rawValue: section)
        
        if let tableSection = optionalSection {
            return tableSection
        } else {
            return .none
        }
    }
    
}

class EvHiveHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        tableViewConfiguration()
    }
    
    fileprivate func tableViewConfiguration(){
        self.tableView.register(UINib(nibName: "SearchingJobsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "SearchingJobsTableViewCell")
        self.tableView.register(UINib(nibName: "JobCategoryTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "JobCategoryTableViewCell")
        self.tableView.register(UINib(nibName: "ProfileIconTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ProfileIconTableViewCell")
        self.tableView.register(UINib(nibName: "JobCardTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "JobCardCell")
        self.tableView.register(UINib(nibName: "ChatBubbleSentTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ChatBubbleSentTableViewCell")
        self.tableView.register(UINib(nibName: "ChatBubbleReceivedTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ChatBubbleReceivedTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    fileprivate func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let height = CGFloat(100)
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: height))
        let navItem = UINavigationItem(title: "")
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(done))
        self.titleLabel.backgroundColor = UIColorFromRGB(rgbValue: 0x27A5FF)
        self.titleLabel.layer.cornerRadius = 12.5
        navItem.rightBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    fileprivate func searchingJobsCell(_ tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchingJobsTableViewCell") as? SearchingJobsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.activityIndicator.startAnimating()
        
        return cell
    }
    
    fileprivate func jobCategoryCell(_ tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JobCategoryTableViewCell") as? JobCategoryTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    fileprivate func profileIconCell(_ tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileIconTableViewCell") as? ProfileIconTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    fileprivate func jobCardCell(_ tableView: UITableView, index: Int) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JobCardCell") as? JobCardTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(index: index)
        
        return cell
    }
    
    fileprivate func chatSentCell(_ tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChatBubbleSentTableViewCell") as? ChatBubbleSentTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    fileprivate func chatReceivedCell(_ tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChatBubbleReceivedTableViewCell") as? ChatBubbleReceivedTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    @objc func done() {
        
    }
    
    //MARK - TABLEVIEW DATASOURCE
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableSections.tableSectionFromInt(section).rawValue == 4 {
            return 2
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableSection = tableSections.tableSectionFromInt(indexPath.section)
        
        switch(tableSection) {
        case .profileIconCell: return profileIconCell(tableView)
        case .chatReceived: return chatReceivedCell(tableView)
        case .chatSent: return chatSentCell(tableView)
        case .jobCategory: return jobCategoryCell(tableView)
        case .jobCard: return jobCardCell(tableView, index: indexPath.row)
        case .searchingJobs: return searchingJobsCell(tableView)
        default: return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableSection = tableSections.tableSectionFromInt(indexPath.section)
        
        switch(tableSection) {
        case .profileIconCell:
            return CGFloat(66)
        case .chatReceived:
            return CGFloat(33)
        case .chatSent:
            return CGFloat(33)
        case .jobCategory:
            return CGFloat(82)
        case .jobCard:
            return CGFloat(200)
        case .searchingJobs:
            return CGFloat(160)
        default:
            return CGFloat(0)
        }
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    @IBAction func optionButtonTapped(_ sender: Any) {
        print("tapped")
        let modalViewController = OptionViewController()
        modalViewController.modalPresentationStyle = .overCurrentContext
        self.present(modalViewController, animated: true, completion: nil)
    }
    
}

