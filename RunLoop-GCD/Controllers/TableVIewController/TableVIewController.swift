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
        
        self.view.addSubview(infoTextView)
        
        infoTextView.frame = CGRect(x: 0, y: 40, width: UIScreen.main.bounds.size.width, height: 95)
        infoTextView.backgroundColor = .lightGray
        infoTextView.textColor = .white
        infoTextView.font = .systemFont(ofSize: 16)
        
        setInfoTextViewConstraints()
        
        self.view.addSubview(resetButton)
        
        resetButton.layer.cornerRadius = 20
        resetButton.frame = CGRect(x: UIScreen.main.bounds.size.width/2-40, y: UIScreen.main.bounds.size.height-130, width: 80, height: 40)
        resetButton.backgroundColor = .lightGray
        resetButton.setTitle("Reset", for: .normal)
        resetButton.isUserInteractionEnabled = true
        resetButton.addTarget(self, action: #selector(resetTableView), for: .touchUpInside)
        
        // Get JSON data.
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
    
    @objc func resetTableView() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: false)
        
        self.tableView.reloadData()
    }
}

