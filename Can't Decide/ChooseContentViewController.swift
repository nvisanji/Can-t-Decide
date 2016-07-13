//
//  ChooseContentViewController.swift
//  Can't Decide
//
//  Created by Nadeem Visanji on 7/12/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class ChooseContentViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var sparImageView: UIImageView!
    @IBOutlet weak var eggrImageView: UIImageView!
    @IBOutlet weak var turkeyrImageView: UIImageView!
    @IBOutlet weak var chickenrImageView: UIImageView!
    @IBOutlet weak var gyozarImageView: UIImageView!
    
    var theTitle: String!
    var theCircleIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Grab the title that was passed from the choose screen and place it into the label
        //titleLabel.text = theTitle
        if theCircleIndex == 0 {
            titleLabel.text = "Spaghetti and meatballs"
            sparImageView.alpha = 1
            eggrImageView.alpha = 0
            turkeyrImageView.alpha = 0
            chickenrImageView.alpha = 0
            gyozarImageView.alpha = 0
            contentScrollView.contentSize = sparImageView.image!.size
            contentScrollView.delegate = self
        } else if theCircleIndex == 1 {
            titleLabel.text = "Scrambled eggs"
            sparImageView.alpha = 0
            eggrImageView.alpha = 1
            turkeyrImageView.alpha = 0
            chickenrImageView.alpha = 0
            gyozarImageView.alpha = 0
            contentScrollView.contentSize = eggrImageView.image!.size
            contentScrollView.delegate = self
        } else if theCircleIndex == 2 {
            titleLabel.text = "Turkey burgers"
            sparImageView.alpha = 0
            eggrImageView.alpha = 0
            turkeyrImageView.alpha = 1
            chickenrImageView.alpha = 0
            gyozarImageView.alpha = 0
            contentScrollView.contentSize = turkeyrImageView.image!.size
            contentScrollView.delegate = self
        } else if theCircleIndex == 3 {
            titleLabel.text = "Chicken with rice"
            sparImageView.alpha = 0
            eggrImageView.alpha = 0
            turkeyrImageView.alpha = 0
            chickenrImageView.alpha = 1
            gyozarImageView.alpha = 0
            contentScrollView.contentSize = chickenrImageView.image!.size
            contentScrollView.delegate = self
        } else {
            titleLabel.text = "Gyoza"
            sparImageView.alpha = 0
            eggrImageView.alpha = 0
            turkeyrImageView.alpha = 0
            chickenrImageView.alpha = 0
            gyozarImageView.alpha = 1
            contentScrollView.contentSize = gyozarImageView.image!.size
            contentScrollView.delegate = self
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // close the view controller
    @IBAction func didTapClose(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
