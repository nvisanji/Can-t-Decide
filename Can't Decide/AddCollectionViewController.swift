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

    @IBOutlet weak var fieldSuperView: UIView!
    @IBOutlet weak var addCategoryLabel: UILabel!
    
    var collectionListViewController: CollectionListViewController!
    
    var fullCategory: String!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    
    let alertController = UIAlertController(title: "Oopsies", message: "Please enter an category name", preferredStyle: .Alert)
    
    let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
        // handle cancel response here. Doing nothing will dismiss the view.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //titleStyle(addCategoryLabel)
        fieldStyle(collectionNameAC)
        fieldStyle(collectionDescriptionAC)
        
        collectionNameAC.becomeFirstResponder()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
        
        initialY = fieldSuperView.frame.origin.y
        offset = -50
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  
        
        if collectionNameAC.text!.isEmpty{
            //show alert
            alertController.addAction(cancelAction)
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
            
        } else {
        
        
        var collectionDetailViewController = segue.destinationViewController as! CollectionDetailViewController
        
        //setting field values to detail view
        collectionDetailViewController.collectionCD = collectionNameAC.text
        collectionDetailViewController.descripCD = collectionDescriptionAC.text
        
        //trying to put this in prepare for segue instead of add - gets an Optional nil error.  Can I add something to another VC's array without actually going to that array?
        fullCategory = collectionNameAC.text! + ", " + collectionDescriptionAC.text!
        
        print(fullCategory)
        
        
        //collectionListViewController.addToCollectionList(fullCategory)

        }

   
    }
    

    
    @IBAction func pressCancel(sender: AnyObject) {
        view.endEditing(true)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //add category to the collectionListVC
//    @IBAction func addCategory(sender: AnyObject) {
//        
//        fullCategory = collectionNameAC.text! + ", " + collectionDescriptionAC.text!
//        
//        print(fullCategory)
//        
//        collectionListViewController.addToCollectionList(fullCategory)
//        
//        //dismissViewControllerAnimated(true, completion: nil)
//        
//    }


    
    func fieldStyle(textField: UITextField){
        var borderColor : UIColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        textField.layer.borderWidth = 0.7
        textField.layer.borderColor = borderColor.CGColor
        textField.layer.cornerRadius = 5.0
        
        textField.font = UIFont(name: "Activ Grotesk", size: 16)
        
        var paddingView = UIView(frame:CGRectMake(10, 10, 15, 15))
        textField.leftView = paddingView;
        textField.leftViewMode =  UITextFieldViewMode.Always

    }
    
//    func titleStyle(labelText: UILabel){
//        labelText.font = UIFont(name: "Bree Serif", size: 28)
//        
//    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        fieldSuperView.frame.origin.y = initialY + offset
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldSuperView.frame.origin.y = initialY
    }

    @IBAction func didTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

}
