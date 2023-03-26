//
//  New_TableViewCell.swift
//  Data_btn_project
//
//  Created by iroid on 15/11/22.
//  Copyright © 2022 iroid. All rights reserved.
//

import UIKit

class New_TableViewCell: UITableViewCell {
    @IBOutlet weak var labl1: UILabel!
    @IBOutlet weak var labl2: UILabel!
    @IBOutlet weak var labl3: UILabel!
    
    @IBOutlet weak var newTable: UIView!
    override func awakeFromNib() {
        self.newTable.backgroundColor = UIColor(patternImage: UIImage(named:"new1")!)

        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
