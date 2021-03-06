//
//  ChooseViewController.swift
//  Can't Decide
//
//  Created by Nadeem Visanji on 6/21/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var spaImageView: UIImageView!
    @IBOutlet weak var eggsImageView: UIImageView!
    @IBOutlet weak var gyozaImageView: UIImageView!
    @IBOutlet weak var chickenImageView: UIImageView!
    @IBOutlet weak var turkeyImageView: UIImageView!
    @IBOutlet weak var buttonHolderView: UIView!
    @IBOutlet weak var decidedView: UIView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var imDoneButton: UIButton!
    @IBOutlet weak var chooseAgain: UIButton!
    
    var selectedImageView: UIImageView!
    var circleOriginalCenter: CGPoint!
    var decidedOrigin: CGFloat!
    var buttonHolderOrigin: CGFloat!
    var spaOriginalCenter: CGPoint!
    var eggsOriginalCenter: CGPoint!
    var gyozaOriginalCenter: CGPoint!
    var chickenOriginalCenter: CGPoint!
    var turkeyOriginalCenter: CGPoint!
    
    //variable to keep track of the circle that was selected
    var selectedCircleIndex: Int = 0
    
    //animation duration variable
    var circleDuration: NSTimeInterval!
    var circleBreak: Int = 0
    
    // picker content
    var pickOption = ["15 minutes", "30 minutes", "45 minutes", "50 minutes", "60 minutes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the originals
        buttonHolderOrigin = buttonHolderView.frame.origin.y
        decidedOrigin = decidedView.frame.origin.y + 250
        spaOriginalCenter = spaImageView.center
        eggsOriginalCenter = eggsImageView.center
        gyozaOriginalCenter = gyozaImageView.center
        chickenOriginalCenter = chickenImageView.center
        turkeyOriginalCenter = turkeyImageView.center

        // Set the cancel and choose again button border colors (can only so this programatically
        cancelButton.layer.borderColor = UIColor(red: 114/255, green: 186/255, blue: 69/255, alpha: 1.0).CGColor
        cancelButton.layer.borderWidth = 1
        chooseAgain.layer.borderColor = UIColor(red: 114/255, green: 186/255, blue: 69/255, alpha: 1.0).CGColor
        chooseAgain.layer.borderWidth = 1
        
        fieldStyle(textField)
        
        // start picker
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40)
        headerView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
        
        let button = UIButton(type: .System)
        button.frame = CGRect(x: headerView.frame.size.width - 80, y: 0, width: 100, height: 30)
        button.center.y = headerView.center.y
        button.setTitle("Done", forState: .Normal)
        button.addTarget(self, action: "onDoneButton", forControlEvents: .TouchUpInside)
        headerView.addSubview(button)
        
        // set the picker
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
        textField.inputView = containerView
        
        view.endEditing(false)
        // end the picker
        
        //place the decided view out of the way
        decidedView.frame.origin.y = decidedOrigin
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPanCircle(sender: UIPanGestureRecognizer) {
        
        var point = sender.locationInView(view)
        var velocity = sender.velocityInView(view)
        let translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            
            print("Gesture began at: \(point)")
            
            //get the selected image view and find the center of that image view
            selectedImageView = sender.view as! UIImageView
            circleOriginalCenter = selectedImageView.center
            
            // bring the selected view come to the front when being panned
            let superview = sender.view?.superview
            superview?.bringSubviewToFront(sender.view!)
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            print("Gesture changed at: \(point)")
            
            //allow the image to be dragged around
            selectedImageView.center = CGPoint(x: circleOriginalCenter.x + translation.x, y: circleOriginalCenter.y + translation.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            print("Gesture ended at: \(point)")
            
        }
        
    }

    @IBAction func didTapContent(sender: UITapGestureRecognizer) {
        
        // determine what image was selected
        selectedImageView = sender.view as! UIImageView
        
        // set the image index value and assign it to the global variable to be captured by the prepareForSegue method
        selectedCircleIndex = selectedImageView.tag
        
        performSegueWithIdentifier("contentSegue", sender: self)
        
    }
    
    // Pass some data
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destinationViewController = segue.destinationViewController as! ChooseContentViewController
        
        // send the proper index value to the content view controller based on the circle that was selected
        destinationViewController.theCircleIndex = selectedCircleIndex
        
    }
    
    // Trigger the selection animation on tap of "decide for me"
    @IBAction func didTapDecide(sender: AnyObject) {
        
        //set the animation with duration value
        circleDuration = 0.5
        
        moveToSpace()
        delay(1.0) { self.eggs(self.circleDuration) }
        
    }
    
    // On tap of decide, drop out the buttons tray and place the circles into their starting positions while adjusting their alpha levels
    func moveToSpace() {
        
        UIView.animateWithDuration(1.0, delay: 0,
            options:[] , animations: { () -> Void in
                self.buttonHolderView.frame.origin.y += self.buttonHolderView.frame.origin.y + 100
                self.spaImageView.frame.origin = CGPointMake(116, 116)
                self.eggsImageView.frame.origin = CGPointMake(207, 200)
                self.turkeyImageView.frame.origin = CGPointMake(176, 308)
                self.chickenImageView.frame.origin = CGPointMake(60, 308)
                self.gyozaImageView.frame.origin = CGPointMake(20, 200)
                self.spaImageView.alpha = 0.2
                self.eggsImageView.alpha = 0.2
                self.turkeyImageView.alpha = 0.2
                self.chickenImageView.alpha = 0.2
                self.gyozaImageView.alpha = 0.2
            }, completion: { (Bool) -> Void in
        })
        
    }
    
    
    // <Begin animation methods>
    // highlight the spaghetti image
    func spa(duration: NSTimeInterval) {
        
        circleBreak += 1
        
        // condition to break out of the circular animation
        if circleBreak == 3 {
            
            chosen()
            
        } else {
        
           UIView.animateWithDuration(duration,
              animations: {
                 self.spaImageView.alpha = 1.0
                 self.eggsImageView.alpha = 0.2
                 self.turkeyImageView.alpha = 0.2
                 self.chickenImageView.alpha = 0.2
                 self.gyozaImageView.alpha = 0.2
              },
              completion: { finished in self.eggs(self.circleDuration) }
           )
            
        }

    }
    
    // highlight the eggs image
    func eggs(duration: NSTimeInterval) {
        
        UIView.animateWithDuration(duration,
            animations: {
               self.spaImageView.alpha = 0.2
               self.eggsImageView.alpha = 1.0
               self.turkeyImageView.alpha = 0.2
               self.chickenImageView.alpha = 0.2
               self.gyozaImageView.alpha = 0.2
            },
            completion: { finished in self.turkey(self.circleDuration) }
        )
        
    }
    
    // highlight the turkey image
    func turkey(duration: NSTimeInterval) {
        
        UIView.animateWithDuration(duration,
            animations: {
                self.spaImageView.alpha = 0.2
                self.eggsImageView.alpha = 0.2
                self.turkeyImageView.alpha = 1.0
                self.chickenImageView.alpha = 0.2
                self.gyozaImageView.alpha = 0.2
            },
            completion: { finished in self.chicken(self.circleDuration) }
        )
        
    }
    
    // highlight the chicken image
    func chicken(duration: NSTimeInterval) {
        
        UIView.animateWithDuration(duration,
            animations: {
                self.spaImageView.alpha = 0.2
                self.eggsImageView.alpha = 0.2
                self.turkeyImageView.alpha = 0.2
                self.chickenImageView.alpha = 1.0
                self.gyozaImageView.alpha = 0.2
            },
            completion: { finished in self.gyoza(self.circleDuration) }
        )
        
    }
    
    // highlight the gyoza image
    func gyoza(duration: NSTimeInterval) {
        
        UIView.animateWithDuration(duration,
            animations: {
                self.spaImageView.alpha = 0.2
                self.eggsImageView.alpha = 0.2
                self.turkeyImageView.alpha = 0.2
                self.chickenImageView.alpha = 0.2
                self.gyozaImageView.alpha = 1.0
            },
            completion: { finished in self.spa(self.circleDuration) }
        )
        
    }
    // </end animation methods>
    
    // get the selected circle
    func chosen() {
        
        UIView.animateWithDuration(1.0, delay: 0,
            options:[] , animations: { () -> Void in
                
                if self.textField.text == "15 minutes" {
                    
                    self.eggsImageView.transform = CGAffineTransformScale(self.eggsImageView.transform, 1.5, 1.5)
                    self.eggsImageView.center.x = self.view.center.x
                    self.eggsImageView.center.y = self.view.center.y - 100
                    self.spaImageView.alpha = 0.0
                    self.eggsImageView.alpha = 1.0
                    self.turkeyImageView.alpha = 0.0
                    self.chickenImageView.alpha = 0.0
                    self.gyozaImageView.alpha = 0.0
                    
                } else if self.textField.text == "30 minutes" {
                
                    self.gyozaImageView.transform = CGAffineTransformScale(self.gyozaImageView.transform, 1.5, 1.5)
                    self.gyozaImageView.center.x = self.view.center.x
                    self.gyozaImageView.center.y = self.view.center.y - 100
                    self.spaImageView.alpha = 0.0
                    self.eggsImageView.alpha = 0.0
                    self.turkeyImageView.alpha = 0.0
                    self.chickenImageView.alpha = 0.0
                    self.gyozaImageView.alpha = 1.0
                    
                } else if self.textField.text == "45 minutes" {
                    
                    self.turkeyImageView.transform = CGAffineTransformScale(self.turkeyImageView.transform, 1.5, 1.5)
                    self.turkeyImageView.center.x = self.view.center.x
                    self.turkeyImageView.center.y = self.view.center.y - 100
                    self.spaImageView.alpha = 0.0
                    self.eggsImageView.alpha = 0.0
                    self.turkeyImageView.alpha = 1.0
                    self.chickenImageView.alpha = 0.0
                    self.gyozaImageView.alpha = 0.0
                    
                } else if self.textField.text == "50 minutes" {
                    
                    self.spaImageView.transform = CGAffineTransformScale(self.spaImageView.transform, 1.5, 1.5)
                    self.spaImageView.center.x = self.view.center.x
                    self.spaImageView.center.y = self.view.center.y - 100
                    self.spaImageView.alpha = 1.0
                    self.eggsImageView.alpha = 0.0
                    self.turkeyImageView.alpha = 0.0
                    self.chickenImageView.alpha = 0.0
                    self.gyozaImageView.alpha = 0.0
                    
                } else if self.textField.text == "60 minutes" {
                    
                    self.chickenImageView.transform = CGAffineTransformScale(self.chickenImageView.transform, 1.5, 1.5)
                    self.chickenImageView.center.x = self.view.center.x
                    self.chickenImageView.center.y = self.view.center.y - 100
                    self.spaImageView.alpha = 0.0
                    self.eggsImageView.alpha = 0.0
                    self.turkeyImageView.alpha = 0.0
                    self.chickenImageView.alpha = 1.0
                    self.gyozaImageView.alpha = 0.0
                    
                }
                
                
                // bring in the decided ui view with the buttons
                self.decidedView.frame.origin.y = self.buttonHolderOrigin
                
                
                
            }, completion: { (Bool) -> Void in
        })
        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    // user taps on i'm done
    @IBAction func didTapDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // user taps choose again - sets everything back to the origin
    @IBAction func didTapChooseAgain(sender: AnyObject) {
        
        UIView.animateWithDuration(1.0, delay: 0,
            options:[] , animations: { () -> Void in
                
                self.buttonHolderView.frame.origin.y = self.buttonHolderOrigin
                self.decidedView.frame.origin.y = self.decidedOrigin
                
                self.spaImageView.center = self.spaOriginalCenter
                self.spaImageView.alpha = 1.0
                if self.textField.text == "50 minutes" {
                    self.spaImageView.transform = CGAffineTransformScale(self.spaImageView.transform, 0.65, 0.65)
                }
                
                self.eggsImageView.center = self.eggsOriginalCenter
                self.eggsImageView.alpha = 1.0
                if self.textField.text == "15 minutes" {
                    self.eggsImageView.transform = CGAffineTransformScale(self.eggsImageView.transform, 0.65, 0.65)
                }
                
                self.gyozaImageView.center = self.gyozaOriginalCenter
                self.gyozaImageView.alpha = 1.0
                if self.textField.text == "30 minutes" {
                    self.gyozaImageView.transform = CGAffineTransformScale(self.gyozaImageView.transform, 0.65, 0.65)
                }
                
                self.chickenImageView.center = self.chickenOriginalCenter
                self.chickenImageView.alpha = 1.0
                if self.textField.text == "60 minutes" {
                    self.chickenImageView.transform = CGAffineTransformScale(self.chickenImageView.transform, 0.65, 0.65)
                }
                
                self.turkeyImageView.center = self.turkeyOriginalCenter
                self.turkeyImageView.alpha = 1.0
                if self.textField.text == "45 minutes" {
                    self.turkeyImageView.transform = CGAffineTransformScale(self.turkeyImageView.transform, 0.65, 0.65)
                }
                
            }, completion: { (Bool) -> Void in
        })
        
        circleBreak = 0
        
    }
    
    
    
    // functions to stye the text box
    func fieldStyle(textbox: UITextField){
        var borderColor : UIColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        textbox.layer.borderWidth = 0.7
        textbox.layer.borderColor = borderColor.CGColor
        textbox.layer.cornerRadius = 2.0
        
        textbox.font = UIFont(name: "Activ Grotesk", size: 14)
        
        var paddingView = UIView(frame:CGRectMake(16, 16, 16, 16))
        textbox.leftView = paddingView;
        textbox.leftViewMode =  UITextFieldViewMode.Always
        
    }
    
    // more picker functions
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = pickOption[row]
        //self.view.endEditing(true)
    }
    
    func onDoneButton() { self.view.endEditing(true) }
    // end picker functions
    
    @IBAction func didPressCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
