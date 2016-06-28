//
//  AddItemViewController.swift
//  Can't Decide
//
//  Created by Kelly Bryant on 6/21/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var ItemNameFieldAI: UITextField!
    @IBOutlet weak var ItemDescriptionFieldAI: UITextField!
    
    @IBOutlet weak var timeFieldAI: UITextField!

    @IBOutlet weak var unitLabelAI: UILabel!


    
    var fullItem: String!
    
    var collectionDetailViewController: CollectionDetailViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    //add Item name to the array on collection detail view
    @IBAction func addItem(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)


        
        fullItem = ItemNameFieldAI.text! + ", " + ItemDescriptionFieldAI.text! + ", " + timeFieldAI.text! + ", " + unitLabelAI.text!
        
        collectionDetailViewController.addToItemData(fullItem)
        
    }

    
    
}
