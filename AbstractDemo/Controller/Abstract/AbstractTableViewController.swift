//
//  AbstractTableViewController.swift
//  AbstractDemo
//
//  Created by Ramanpreet Singh on 2020-03-13.
//  Copyright © 2020 Ramanpreet Singh. All rights reserved.
//

import UIKit

/*
 AbstractTableListControl to manage all common functions to show list with tableview
 */
class AbstractTableViewController: UITableViewController {
    
    // MARK: Global variables
    internal var items: Array<Any>! = []
    
    // MARK: Stored variables
    internal var cellClass: AbstractTableViewCell.Type {
        return AbstractTableViewCell.self
    }
    
    internal var reuseId: String {
        return cellClass.reuseId
    }
    
    // MARK: Required initialize methods
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(style: UITableView.Style) {
        super.init(style: style)
    }
    
    // MARK: View load functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup tableview
        setupTableView()
        // request for data
        requestItems()
    }
    
    // MARK: - Setup tableview properties
    private func setupTableView() {
        // basic table view properties
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        // register cell
        tableView!.register((UINib(nibName: String(describing: cellClass), bundle: nil)), forCellReuseIdentifier: reuseId)
        tableView!.showsVerticalScrollIndicator = false
        tableView!.alwaysBounceVertical = true
    }
    
    // MARK: Request for items
    private func requestItems() {
        requestItems(page: 1, completion: {(items, error, pageAvailable) in
            if error == nil && items != nil {
                self.items.append(contentsOf: items!)
                self.tableView?.reloadData()
            }
        })
    }
    
    // MARK: - Abstract request method
    internal func requestItems(page: Int, completion: @escaping (_ : Array<Any>?, _ : NSError?, _ : Bool?) -> Void) {
        completion(nil, nil, false); // Default implementation
    }
    
    // MARK: - UITableViewDataSource and UITableViewDelegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellClass.reuseId, for: indexPath) as! AbstractTableViewCell
        cell.updateWithModel(items[indexPath.row] as AnyObject)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
