//
//  TableViewDataSource.swift
//  swift-weather
//
//  Created by User on 2020/3/20.
//  Copyright © 2020 NTUB. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell {

    let cellIdentifier: String
    var viewModels: [ViewModel]
    let configureCell: (CellType, ViewModel) -> ()
    
    init(cellIdentifier: String, viewModels: [ViewModel], configureCell: @escaping (CellType, ViewModel) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.viewModels = viewModels
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? CellType else {
            fatalError("Cell with identifier \(self.cellIdentifier) not found")
        }
        
        let vm = self.viewModels[indexPath.row]
        
        self.configureCell(cell, vm)
        
        return cell
    }

}
