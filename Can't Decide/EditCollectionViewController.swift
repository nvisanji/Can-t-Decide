//
//  EditCollectionViewController.swift
//  Can't Decide
//
//  Created by Kelly Bryant on 6/21/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class EditCollectionViewController: UIViewController {

    @IBOutlet weak var collectionFieldEC: UITextField!
    @IBOutlet weak var descripFieldEC: UITextField!

    @IBOutlet weak var updateBtn: UIButton!
    
    @IBOutlet weak var editTitle: UILabel!
    @IBOutlet var fieldSuperView: UIView!
    
    var editCollectionEC: String!
    var editDescripEC: String!
    
    var collectionDetailViewController: CollectionDetailViewController!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set field text to the collection name and description
        collectionFieldEC.text = editCollectionEC
        descripFieldEC.text = editDescripEC
        
        fieldStyle(collectionFieldEC)
        fieldStyle(descripFieldEC)
        //titleStyle(editTitle)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
        
        initialY = fieldSuperView.frame.origin.y
        offset = -50
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    
    @IBAction func onBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func didUpdate(sender: AnyObject) {

        collectionDetailViewController.collectionLabelCD.text = collectionFieldEC.text
        collectionDetailViewController.descripLabelCD.text = descripFieldEC.text

        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        fieldSuperView.frame.origin.y = initialY + offset
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldSuperView.frame.origin.y = initialY
    }
    
    @IBAction func didTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
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

    
}
