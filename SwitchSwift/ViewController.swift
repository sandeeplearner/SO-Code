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

    let data = ["sandeep","Gopal","Bhandari","sandeep","Gopal","Bhandari","sandeep","Gopal","Bhandari","sandeep","Gopal","Bhandari","sandeep","Gopal","Bhandari","sandeep","Gopal","Bhandari","sandeep","Gopal","Bhandari","sandeep","Gopal","Bhandari","sandeep","Gopal","Bhandari"]
    var selectedIndexPathArray = [NSIndexPath]()
    
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
        
        if status == true {
            if self.selectedIndexPathArray.indexOf(indexPath!) == nil {
                self.selectedIndexPathArray.append(indexPath!)
            }
        }
        else{
            if let index =  self.selectedIndexPathArray.indexOf(indexPath!) {
                self.selectedIndexPathArray.removeAtIndex(index)
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! myCell
        tableCell.delegate = self
        tableCell.myLabel.text? = data[indexPath.row]
        
        if self.selectedIndexPathArray.contains(indexPath) {
            tableCell.mySwitch.setOn(true, animated: false)
        }
        else{
            tableCell.mySwitch.setOn(false, animated: false)
        }
        return tableCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let index =  self.selectedIndexPathArray.indexOf(indexPath) {
            self.selectedIndexPathArray.removeAtIndex(index)
        }
        else{
            self.selectedIndexPathArray.append(indexPath)
        }
        
        let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! myCell
        cell.toggleSwitch()
    }
}

