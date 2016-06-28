//
//  CollectionListTableViewCell.swift
//  Can't Decide
//
//  Created by Kelly Bryant on 6/26/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class CollectionListTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionDescriptionLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
