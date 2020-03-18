//
//  TableVIewController.swift
//  RunLoop-GCD
//
//  Created by Nikolay Gutorov on 3/12/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

enum CellImageAssignMode { case RunLoop, GCD, None }

class DemoTableViewController: UIViewController {
    
    let infoTextView = UITextView()
    let resetButton = UIButton()
    var tableView = UITableView()
    var cellImageAssignMode: CellImageAssignMode = .None
    var titleArray = [String]()
    var thumbnailUrlArray = [String]()
    
    // JSON file URL.
    let sourceURL = "http://jsonplaceholder.typicode.com/photos"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        
        if ConnectionCheck.isConnectedToNetwork() {
            
            addTableView()
            addInfoTextView()
            addResetButton()
            getJsonData(withUrl: sourceURL)
            
        } else {
            
            showAlert(title: "No network connection!", message: "Please check your connection and restart the application.", showCancel: false, okLabel: "Try again") { [weak self] in
                self?.viewDidLoad()
            }
        }
    }
    
    func addTableView() {
        
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DemoCustomCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        
        setTableViewConstraints()
    }
    
    func addInfoTextView() {
        
        self.view.addSubview(infoTextView)
        
        infoTextView.frame = CGRect(x: 0, y: statusBarHeight, width: UIScreen.main.bounds.size.width, height: 113)
        infoTextView.layer.cornerRadius = 18
        infoTextView.clipsToBounds = true
        infoTextView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        infoTextView.backgroundColor = .lightGray
        infoTextView.textColor = .white
        infoTextView.isEditable = false
        infoTextView.isSelectable = false
        infoTextView.font = .systemFont(ofSize: 16)
        
        setInfoTextViewConstraints()
    }
    
    func addResetButton() {
        
        self.view.addSubview(resetButton)
        
        resetButton.layer.cornerRadius = 14
        resetButton.frame = CGRect(x: UIScreen.main.bounds.size.width-100, y: statusBarHeight+47, width: 80, height: 34)
        resetButton.backgroundColor = .white
        resetButton.setTitleColor(.darkGray, for: .normal)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.isUserInteractionEnabled = true
        
        resetButton.addTarget(self, action: #selector(resetTableView), for: .touchUpInside)
    }
    
    @objc func resetTableView() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: false)
        
        self.tableView.reloadData()
    }
}

