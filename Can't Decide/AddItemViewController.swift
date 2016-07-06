//
//  AddItemViewController.swift
//  Can't Decide
//
//  Created by Kelly Bryant on 6/21/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ItemNameFieldAI: UITextField!
    @IBOutlet weak var ItemDescriptionFieldAI: UITextField!
    
    @IBOutlet weak var fieldSuperView: UIView!
    @IBOutlet weak var timeFieldAI: UITextField!
    
    
    @IBOutlet weak var addItemTitle: UILabel!
    @IBOutlet var addPhotoBtn: UIButton!
    @IBOutlet var changePhotoBtn: UIButton!

    @IBOutlet weak var unitLabelAI: UILabel!

    //var pickOption = ["5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60"]
    //var pickOptionHours = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    //var pickOptionDays = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    var hour:Int = 0
    var minute:Int = 0
    
    //var pickOption = [["Days", "1", "2", "3"], ["Hours", "1", "2", "3"], ["Minutes", "1", "2", "3"]]
    var pickOption = [["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60"], ["Minutes", "Hours", "Days"]]
    
    //var pickOption = [["5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60"], ["Minutes", "Hours", "Days"]]
    
    
    var fullItem: String!
    
    var collectionDetailViewController: CollectionDetailViewController!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    
    

    
    let alertController = UIAlertController(title: "Oopsies", message: "Please enter an item name", preferredStyle: .Alert)

    let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
        // handle cancel response here. Doing nothing will dismiss the view.
    }

    //image picker
    let vc = UIImagePickerController()
    
    //var selectedImage: UIImage!
    
    @IBOutlet var selectedImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc.delegate = self
        vc.allowsEditing = true
        //vc.sourceType = UIImagePickerControllerSourceType.Camera
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        selectedImage.hidden = true
        
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40)
        headerView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
        
        let button = UIButton(type: .System)
        button.frame = CGRect(x: headerView.frame.size.width - 80, y: 0, width: 100, height: 30)
        button.center.y = headerView.center.y
        button.setTitle("Done", forState: .Normal)
        button.addTarget(self, action: "onDoneButton", forControlEvents: .TouchUpInside)
        headerView.addSubview(button)

        let pickerView = UIPickerView()
        pickerView.frame.origin.y += headerView.frame.size.height
        pickerView.delegate = self
        pickerView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
        pickerView.frame = CGRect(x: 0, y: 40, width: view.frame.size.width, height: 175)
        print(pickerView.frame)

        let containerView = UIView()
        
        containerView.frame = CGRect(x: 0, y: 0, width: pickerView.frame.size.width, height: pickerView.frame.size.height + headerView.frame.size.height)
        containerView.addSubview(headerView)
        containerView.addSubview(pickerView)
        containerView.backgroundColor = UIColor(white: 1, alpha: 0.1)
        
        //pickerTextField.inputView = pickerView
        timeFieldAI.inputView = containerView

        //style elements
        fieldStyle(ItemNameFieldAI)
        fieldStyle(ItemDescriptionFieldAI)
        fieldStyle(timeFieldAI)
        //titleStyle(addItemTitle)
        
        view.endEditing(false)
        ItemNameFieldAI.becomeFirstResponder()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
        
        initialY = fieldSuperView.frame.origin.y
        offset = -50
        

        // Do any additional setup after loading the view.
    }
    
    func onDoneButton() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backBtn(sender: AnyObject) {
        view.endEditing(true)
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    //add Item name to the array on collection detail view
    @IBAction func addItem(sender: AnyObject) {
        //dismissViewControllerAnimated(true, completion: nil)


        if ItemNameFieldAI.text!.isEmpty{
            
            alertController.addAction(cancelAction)
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        } else {
        
        fullItem = ItemNameFieldAI.text! + ", " + ItemDescriptionFieldAI.text! + ", " + timeFieldAI.text! + ", " + unitLabelAI.text!
        
        print(fullItem)
        
        collectionDetailViewController.addToItemData(fullItem)
        dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    //# of columns
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //ADDING IN ROW
        if component == 0 {
            return 60
        }
        
        return 3
       
        
        //END ADDING IN ROW
       // return pickOption.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            //self.amount = row
            self.timeFieldAI.text = pickOption[0][row]
            print(self.timeFieldAI.text)
        case 1:
            //self.unit = row
            self.unitLabelAI.text = pickOption[1][row]
            print(self.unitLabelAI.text)
        default:
            print("No component with number \(component)")
        }

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
    

    
    func keyboardWillShow(notification: NSNotification!) {
        fieldSuperView.frame.origin.y = initialY + offset
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldSuperView.frame.origin.y = initialY
    }
    
    @IBAction func didTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func addPhoto(sender: AnyObject) {
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            // Do something with the images (based on your use case)
            addPhotoBtn.hidden = true
            changePhotoBtn.hidden = false
            selectedImage.image = editedImage
            selectedImage.hidden = false
            
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
    }
    
}
