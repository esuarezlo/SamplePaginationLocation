//
//  MyTableViewController.swift
//  SamplePagination
//
//  Created by erns on 16/10/24.
//

import Foundation
import UIKit

class MyTableViewController: UITableViewController {
    
    var data = [String]()
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMoreData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        
        if indexPath.row == data.count - 1 && !isLoading {
            loadMoreData()
        }
        
        return cell
    }
    
    func loadMoreData() {
        isLoading = true
        
        // Simulate an API call to load more data
        DispatchQueue.global().async {
            sleep(2) // Simulate network delay
            let moreData = ["Item \(self.data.count + 1)", "Item \(self.data.count + 2)", "Item \(self.data.count + 3)"]
            DispatchQueue.main.async {
                self.data.append(contentsOf: moreData)
                self.tableView.reloadData()
                self.isLoading = false
            }
        }
    }
}
