//
//  ViewController.swift
//  SwitchSwift
//
//  Created by Sandeep Bhandari on 6/9/16.
//  Copyright © 2016 Sandeep Bhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CellProtocol,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var tableView: UITableView!

    let data = ["sandeep","Gopal","Bhandari"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func switchButtonTapped(WithStatus status: Bool, ForCell cell: myCell) {
        let indexPath = self.tableView .indexPathForCell(cell)
        print("cell at indexpath \(indexPath) tapped with switch status \(status)")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! myCell
        tableCell.delegate = self
        return tableCell
    }
}

