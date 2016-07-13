//
//  PlanContentViewController.swift
//  Can't Decide
//
//  Created by Nadeem Visanji on 7/13/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class PlanContentViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    var theTitle: String!
    var theCircleIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Grab the title that was passed from the choose screen and place it into the label
        //titleLabel.text = theTitle
        if theCircleIndex == 0 {
            titleLabel.text = "Fix door"
            notesLabel.text = "threshold piece"
        } else if theCircleIndex == 1 {
            titleLabel.text = "Fix leaky bathroom faucet"
            notesLabel.text = "o-ring?"
        } else if theCircleIndex == 2 {
            titleLabel.text = "Clean out garage"
            notesLabel.text = "no notes"
        } else if theCircleIndex == 3 {
            titleLabel.text = "Replace trim"
            notesLabel.text = "trim around exterior door"
        } else {
            titleLabel.text = "Touch up paint"
            notesLabel.text = "around the door"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapClose(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
