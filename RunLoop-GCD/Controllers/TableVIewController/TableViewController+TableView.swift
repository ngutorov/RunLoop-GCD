//
//  TableViewController+TableView.swift
//  RunLoop-GCD
//
//  Created by Nikolay Gutorov on 3/12/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import Foundation
import UIKit

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        // Download thumbnail image from URL.
        URLSession.shared.dataTask(with: NSURL(string: thumbnailUrlArray[indexPath.row])! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "No Error")
                return
            }
            
            // RunLoop VS GCD.
            switch self.cellImageAssignMode {
                
            case .GCD:
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    let image = UIImage(data: data!)
                    cell.thumbnailImage.image = image
                    self.infoTextView.text = "Updating image data with DispatchQueue  \n\n\(self.currentMainRunLoopMode())"
                })
                
            case .RunLoop:
                CFRunLoopPerformBlock(CFRunLoopGetMain(), RunLoop.Mode.tracking as CFTypeRef) {
                    
                    let image = UIImage(data: data!)
                    cell.thumbnailImage.image = image
                    self.infoTextView.text = "Updating image data with CFRunLoopPerformBlock \n\n\(self.currentMainRunLoopMode())"
                }
                
            case .None: fatalError("No mode!")
            }
            
        }).resume()
        
        cell.setCellConstraints()
        
        cell.titleLabel.text = "\(indexPath.row) - \(titleArray[indexPath.row])"
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: cell.contentView.frame.height + 15, bottom: 0, right: 0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.infoTextView.text = "Cell \(indexPath.row) selected \n\n\(self.currentMainRunLoopMode())"
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.infoTextView.text = "Scroll finished \n\n\(self.currentMainRunLoopMode())"
    }
    
    func currentMainRunLoopMode() -> String {
        
        let rangeTemp = CFRunLoopGetMain().debugDescription.range(of: "current mode = ")
        let modeTemp = CFRunLoopGetMain().debugDescription[(rangeTemp?.upperBound...)!]
        let range = modeTemp.range(of: ",")
        let mode = modeTemp[..<range!.lowerBound]
        return("Current Main RunLoop mode is \n\(mode)")
    }
}


