//
//  DemoTableViewController.swift
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
    var titleArray = [String]()
    var thumbnailUrlArray = [String]()
    
    var cellImageAssignMode: CellImageAssignMode = .None
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if ConnectionCheck.isConnectedToNetwork() {
            
            prepareUI()
            getJsonData(withUrl: JSON.sourceURL)
            
        } else {
            
            showAlert(title: "No network connection!",
                      message: "Please check your connection and restart the application.",
                      showCancel: false,
                      okLabel: "Try again") { [weak self] in
                self?.viewDidLoad()
            }
        }
    }
}

    //MARK: - Prepare UI
    
extension DemoTableViewController {
    
    func prepareUI() {
        
        self.view.backgroundColor = .lightGray
        
        addTableView()
        setTableViewConstraints()
        
        addInfoTextView()
        setInfoTextViewConstraints()
        
        addResetButton()
    }
    
    func addTableView() {
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DemoCustomCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
    }
    
    func addInfoTextView() {
        self.view.addSubview(infoTextView)
        infoTextView.frame = CGRect(x: 0, y: statusBarHeight, width: UIScreen.main.bounds.size.width, height: 113)
        infoTextView.backgroundColor = .lightGray
        infoTextView.clipsToBounds = false
        infoTextView.layer.shadowColor = UIColor.black.cgColor
        infoTextView.layer.shadowOpacity = 0.5
        infoTextView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        infoTextView.layer.shadowRadius = 10.0
        infoTextView.layer.shouldRasterize = true
        infoTextView.layer.rasterizationScale = UIScreen.main.scale
        infoTextView.textColor = .white
        infoTextView.isEditable = false
        infoTextView.isSelectable = false
        infoTextView.font = .systemFont(ofSize: 16)
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
}

//MARK: - Actions
    
extension DemoTableViewController {
    
    @objc func resetTableView() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: false)
        
        self.tableView.reloadData()
    }
}

