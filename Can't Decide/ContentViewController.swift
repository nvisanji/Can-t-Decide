//
//  ContentViewController.swift
//  Can't Decide
//
//  Created by Nadeem Visanji on 6/24/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var theTitle: String!
    var theCircleIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Grab the title that was passed from the choose screen and place it into the label
        //titleLabel.text = theTitle
        if theCircleIndex == 0 {
            titleLabel.text = "Spaghetti and meatballs"
        } else if theCircleIndex == 1 {
            titleLabel.text = "Scrambled eggs"
        } else if theCircleIndex == 2 {
            titleLabel.text = "Turkey burgers"
        } else if theCircleIndex == 3 {
            titleLabel.text = "Chicken with rice"
        } else {
            titleLabel.text = "Gyoza"
        }
        
        // build up the view controllers for the showcase the details of each of the elements
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapClose(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
