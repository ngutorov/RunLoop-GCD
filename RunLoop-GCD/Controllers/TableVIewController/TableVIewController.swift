//
//  TableVIewController.swift
//  RunLoop-GCD
//
//  Created by Nikolay Gutorov on 3/12/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

enum CellImageAssignMode { case RunLoop, GCD, None }

class TableViewController: UIViewController {
    
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
        
        addTableView()
        addInfoTextView()
        addResetButton()
    
        getJsonData(withUrl: sourceURL)
    }
    
    func addTableView() {
        
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        setTableViewConstraints()
    }
    
    func addInfoTextView() {
        
        self.view.addSubview(infoTextView)
        
        infoTextView.frame = CGRect(x: 0, y: statusBarHeight, width: UIScreen.main.bounds.size.width, height: 95)
        infoTextView.backgroundColor = .lightGray
        infoTextView.textColor = .white
        infoTextView.font = .systemFont(ofSize: 16)
        
        setInfoTextViewConstraints()
    }
    
    func addResetButton() {
        
        self.view.addSubview(resetButton)
        
        resetButton.layer.cornerRadius = 16
        resetButton.frame = CGRect(x: UIScreen.main.bounds.size.width-100, y: statusBarHeight+48, width: 80, height: 32)
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

