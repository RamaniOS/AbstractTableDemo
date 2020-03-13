//
//  DemoListCell.swift
//  AbstractDemo
//
//  Created by Ramanpreet Singh on 2020-03-13.
//  Copyright © 2020 Ramanpreet Singh. All rights reserved.
//

import UIKit

class DemoListCell: AbstractTableViewCell {
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func updateWithModel(_ model: AnyObject) {
        let demo = model as? Demo
        nameLabel.text = demo?.name
        descLabel.text = demo?.desc
    }
    
}
