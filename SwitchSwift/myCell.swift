//
//  myCell.swift
//  SwitchSwift
//
//  Created by Sandeep Bhandari on 6/9/16.
//  Copyright © 2016 Sandeep Bhandari. All rights reserved.
//

import UIKit

protocol CellProtocol : class {
    func switchButtonTapped(WithStatus status : Bool, ForCell cell : myCell)
}

class myCell: UITableViewCell {
    @IBOutlet var myLabel: UILabel!
    weak var delegate : CellProtocol!
    @IBOutlet var mySwitch: UISwitch!
    
    
    //    override func setSelected(selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //        self.delegate .switchButtonTapped(WithStatus: selected, ForCell: self)
    //    }
    
    @IBAction func switchTapped(sender: UISwitch) {
        self.delegate.switchButtonTapped(WithStatus: sender.on, ForCell: self)
    }
    
    func toggleSwitch() {
        if self.mySwitch.on{
            self.mySwitch .setOn(false, animated: true)
            self.delegate.switchButtonTapped(WithStatus: self.mySwitch.on, ForCell: self)
        }
        else{
            self.mySwitch .setOn(true, animated: true)
            self.delegate.switchButtonTapped(WithStatus: self.mySwitch.on, ForCell: self)
        }
    }
}
