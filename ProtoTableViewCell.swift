//
//  ProtoTableViewCell.swift
//  Can't Decide
//
//  Created by Kelly Bryant on 6/24/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class ProtoTableViewCell: UITableViewCell {

  
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
