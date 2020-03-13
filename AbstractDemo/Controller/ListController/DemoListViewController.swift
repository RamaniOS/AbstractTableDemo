//
//  DemoListViewController.swift
//  AbstractDemo
//
//  Created by Ramanpreet Singh on 2020-03-13.
//  Copyright © 2020 Ramanpreet Singh. All rights reserved.
//

import UIKit

class DemoListViewController: AbstractTableViewController {
    
    override var cellClass: AbstractTableViewCell.Type {
        return DemoListCell.self
    }
    
    override func requestItems(page: Int, completion: @escaping (Array<Any>?, NSError?, Bool?) -> Void) {
        let items = [Demo(name: "Test", desc: "i am dec"), Demo(name: "Second Test", desc: "i am long desc i am long desc i am long desc i am long desc i am long desc i am long desc i am long desc i am long desc")]
        completion(items, nil, false)
    }
    
}
