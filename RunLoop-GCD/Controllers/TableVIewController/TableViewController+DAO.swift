//
//  TableViewController+DAO.swift
//  RunLoop-GCD
//
//  Created by Nikolay Gutorov on 3/12/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import Foundation

extension TableViewController {
    
    func getJsonData(withUrl SourceUrl: String) {
        
        guard let url = URL(string: SourceUrl) else {
            print("Error: cannot create URL")
            return()
        }
        
        let urlRequest = URLRequest(url: url)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            
            guard error == nil else {
                print("Error while getting the data")
                print(error!)
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                guard let dataContents = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [[String: Any]] else {
                        print("Error trying to convert data to JSON")
                        return
                }
                
                for content in dataContents {
                    guard let title = content["title"] as? String else {
                        print("Could not get title from JSON")
                        return
                    }
                    
                    self.titleArray.append(title)
                    
                    guard let thumbnailUrl = content["thumbnailUrl"] as? String else {
                        print("Could not get thumbnail URL from JSON")
                        return
                    }
                    
                    self.thumbnailUrlArray.append(thumbnailUrl)
                }
                
                DispatchQueue.main.async { self.tableView.reloadData() }
                
            } catch  {
                print("Error trying to convert data to JSON")
                return
            }
        }
        
        task.resume()
    }
}
