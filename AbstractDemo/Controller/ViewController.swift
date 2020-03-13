//
//  ViewController.swift
//  AbstractDemo
//
//  Created by Ramanpreet Singh on 2020-03-13.
//  Copyright © 2020 Ramanpreet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List Demo"
        navigationController?.navigationBar.prefersLargeTitles = true
        initViews()
    }

    func initViews() {
        let listController = DemoListViewController(style: .plain)
        addChild(listController)
        listController.didMove(toParent: self)
        // add list to specific view
        if let listView = listController.view {
            listContainer.addSubview(listView)
            listView.fillSuperview()
        }
    }
}


extension UIView {
    func fillSuperview() {
        guard let superView = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
        widthAnchor.constraint(equalTo: superView.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: superView.heightAnchor).isActive = true
    }
}

