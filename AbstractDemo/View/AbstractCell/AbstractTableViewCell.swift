//
//  AbstractTableViewCell.swift
//  AbstractDemo
//
//  Created by Ramanpreet Singh on 2020-03-13.
//  Copyright © 2020 Ramanpreet Singh. All rights reserved.
//

import UIKit

/*
 AbstractTableCell to manage all common functions to use list cells
 */
class AbstractTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: Overide required methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        perform(#selector(self.initViews), with: self, afterDelay: 0.01)
    }
    
    @objc func initViews() {
        backgroundColor = .clear
        clipsToBounds = true
    }
    
    class var reuseId: String {
        return String(describing: self)
    }
    
    // MARK: - Abstract method
    internal func updateWithModel(_ model: AnyObject) {}
    
}

