//
//  AddCollectionViewController.swift
//  Can't Decide
//
//  Created by Kelly Bryant on 6/21/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class AddCollectionViewController: UIViewController {

    
    @IBOutlet weak var collectionNameAC: UITextField!
    @IBOutlet weak var collectionDescriptionAC: UITextField!

    
    //adding an itemVC to pass info to it
    //var addItemViewController: AddItemViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  

        var collectionDetailViewController = segue.destinationViewController as! CollectionDetailViewController
        

        //setting field values to detail view
        collectionDetailViewController.collectionCD = collectionNameAC.text
        collectionDetailViewController.descripCD = collectionDescriptionAC.text
        

   
    }
    

    
    @IBAction func pressCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    



}
