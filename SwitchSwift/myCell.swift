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
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.delegate .switchButtonTapped(WithStatus: selected, ForCell: self)
    }
}
