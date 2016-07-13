//
//  PlanViewController.swift
//  Can't Decide
//
//  Created by Nadeem Visanji on 7/12/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class PlanViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var doorImageView: UIImageView!
    @IBOutlet weak var faucetImageView: UIImageView!
    @IBOutlet weak var garageImageView: UIImageView!
    @IBOutlet weak var paintImageView: UIImageView!
    @IBOutlet weak var trimImageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var imDoneButton: UIButton!
    @IBOutlet weak var chooseAgain: UIButton!
    
    @IBOutlet weak var buttonHolderView: UIView!
    @IBOutlet weak var decidedView: UIView!
    
    var selectedImageView: UIImageView!
    var circleOriginalCenter: CGPoint!
    var decidedOrigin: CGFloat!
    var buttonHolderOrigin: CGFloat!
    var doorOriginalCenter: CGPoint!
    var faucetOriginalCenter: CGPoint!
    var garageOriginalCenter: CGPoint!
    var paintOriginalCenter: CGPoint!
    var trimOriginalCenter: CGPoint!
    
    //variable to keep track of the circle that was selected
    var selectedCircleIndex: Int = 0
    
    //animation duration variable
    var circleDuration: NSTimeInterval!
    var circleBreak: Int = 0
    
    // picker content
    var pickOption = ["1 hour", "2 hours", "3 hours", "4 hours", "5 hours", "6 hours", "7 hours", "8 hours", "9 hours", "10 hours"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the originals
        buttonHolderOrigin = buttonHolderView.frame.origin.y
        decidedOrigin = decidedView.frame.origin.y + 400
        doorOriginalCenter = doorImageView.center
        faucetOriginalCenter = faucetImageView.center
        garageOriginalCenter = garageImageView.center
        paintOriginalCenter = paintImageView.center
        trimOriginalCenter = trimImageView.center

        // apply field styles
        fieldStyle(textField)
        
        // Set the cancel and choose again button border colors (can only so this programatically
        cancelButton.layer.borderColor = UIColor(red: 114/255, green: 186/255, blue: 69/255, alpha: 1.0).CGColor
        cancelButton.layer.borderWidth = 1
        chooseAgain.layer.borderColor = UIColor(red: 114/255, green: 186/255, blue: 69/255, alpha: 1.0).CGColor
        chooseAgain.layer.borderWidth = 1
        
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
    
    @IBAction func didTapContent(sender: UITapGestureRecognizer) {
        
        // determine what image was selected
        selectedImageView = sender.view as! UIImageView
        
        // set the image index value and assign it to the global variable to be captured by the prepareForSegue method
        selectedCircleIndex = selectedImageView.tag
        
        performSegueWithIdentifier("contentSegue", sender: self)
        
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
    
    
    // pass some data
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destinationViewController = segue.destinationViewController as! PlanContentViewController
        
        // send the proper index value to the content view controller based on the circle that was selected
        destinationViewController.theCircleIndex = selectedCircleIndex
        
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
    
    @IBAction func onDidTapCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Trigger the selection animation on tap of "decide for me"
    @IBAction func didTapDecide(sender: AnyObject) {
        
        //set the animation with duration value
        circleDuration = 0.5
        
        moveToSpace()
        delay(1.0) { self.faucet(self.circleDuration) }
        
    }
    
    // On tap of decide, drop out the buttons tray and place the circles into their starting positions while adjusting their alpha levels
    func moveToSpace() {
        
        UIView.animateWithDuration(1.0, delay: 0,
            options:[] , animations: { () -> Void in
                self.buttonHolderView.frame.origin.y += self.buttonHolderView.frame.origin.y + 100
                self.doorImageView.frame.origin = CGPointMake(116, 116)
                self.faucetImageView.frame.origin = CGPointMake(207, 200)
                self.garageImageView.frame.origin = CGPointMake(176, 308)
                self.paintImageView.frame.origin = CGPointMake(60, 308)
                self.trimImageView.frame.origin = CGPointMake(20, 200)
                self.doorImageView.alpha = 0.2
                self.faucetImageView.alpha = 0.2
                self.garageImageView.alpha = 0.2
                self.paintImageView.alpha = 0.2
                self.trimImageView.alpha = 0.2
            }, completion: { (Bool) -> Void in
        })
        
    }
    
    
    // <Begin animation methods>
    // highlight the spaghetti image
    func door(duration: NSTimeInterval) {
        
        circleBreak += 1
        
        // condition to break out of the circular animation
        if circleBreak == 3 {
            
            chosen()
            //print("done")
            
        } else {
            
            UIView.animateWithDuration(duration,
                animations: {
                    self.doorImageView.alpha = 1.0
                    self.faucetImageView.alpha = 0.2
                    self.garageImageView.alpha = 0.2
                    self.paintImageView.alpha = 0.2
                    self.trimImageView.alpha = 0.2
                },
                completion: { finished in self.faucet(self.circleDuration) }
            )
            
        }
        
    }
    
    // highlight the eggs image
    func faucet(duration: NSTimeInterval) {
        
        UIView.animateWithDuration(duration,
            animations: {
                self.doorImageView.alpha = 0.2
                self.faucetImageView.alpha = 1.0
                self.garageImageView.alpha = 0.2
                self.paintImageView.alpha = 0.2
                self.trimImageView.alpha = 0.2
            },
            completion: { finished in self.garage(self.circleDuration) }
        )
        
    }
    
    // highlight the turkey image
    func garage(duration: NSTimeInterval) {
        
        UIView.animateWithDuration(duration,
            animations: {
                self.doorImageView.alpha = 0.2
                self.faucetImageView.alpha = 0.2
                self.garageImageView.alpha = 1.0
                self.paintImageView.alpha = 0.2
                self.trimImageView.alpha = 0.2
            },
            completion: { finished in self.paint(self.circleDuration) }
        )
        
    }
    
    // highlight the chicken image
    func paint(duration: NSTimeInterval) {
        
        UIView.animateWithDuration(duration,
            animations: {
                self.doorImageView.alpha = 0.2
                self.faucetImageView.alpha = 0.2
                self.garageImageView.alpha = 0.2
                self.paintImageView.alpha = 1.0
                self.trimImageView.alpha = 0.2
            },
            completion: { finished in self.trim(self.circleDuration) }
        )
        
    }
    
    // highlight the gyoza image
    func trim(duration: NSTimeInterval) {
        
        UIView.animateWithDuration(duration,
            animations: {
                self.doorImageView.alpha = 0.2
                self.faucetImageView.alpha = 0.2
                self.garageImageView.alpha = 0.2
                self.paintImageView.alpha = 0.2
                self.trimImageView.alpha = 1.0
            },
            completion: { finished in self.door(self.circleDuration) }
        )
        
    }
    // </end animation methods>
    
    // get the selected circle
    func chosen() {
        
        UIView.animateWithDuration(1.0, delay: 0,
            options:[] , animations: { () -> Void in
                
                if self.textField.text == "10 hours" {
                    
                    self.garageImageView.alpha = 1.0
                    self.trimImageView.alpha = 1.0
                    self.doorImageView.alpha = 1.0
                    self.faucetImageView.alpha = 0.0
                    self.paintImageView.alpha = 0.0
                    
                    self.garageImageView.center.x = self.view.center.x - 50
                    self.garageImageView.center.y = self.view.center.y - 100
                    self.trimImageView.center.x = self.view.center.x + 50
                    self.trimImageView.center.y = self.view.center.y - 100
                    self.doorImageView.center.x = self.view.center.x - 50
                    self.doorImageView.center.y = self.view.center.y
                    
                } else if self.textField.text == "9 hours" {
                    
                    self.garageImageView.alpha = 1.0
                    self.trimImageView.alpha = 1.0
                    self.doorImageView.alpha = 0.0
                    self.faucetImageView.alpha = 1.0
                    self.paintImageView.alpha = 0.0
                    
                    self.garageImageView.center.x = self.view.center.x - 50
                    self.garageImageView.center.y = self.view.center.y - 100
                    self.trimImageView.center.x = self.view.center.x + 50
                    self.trimImageView.center.y = self.view.center.y - 100
                    self.faucetImageView.center.x = self.view.center.x - 50
                    self.faucetImageView.center.y = self.view.center.y
                    
                } else if self.textField.text == "8 hours" {
                    
                    self.garageImageView.alpha = 1.0
                    self.trimImageView.alpha = 1.0
                    self.doorImageView.alpha = 0.0
                    self.faucetImageView.alpha = 0.0
                    self.paintImageView.alpha = 0.0
                    
                    self.garageImageView.center.x = self.view.center.x - 50
                    self.garageImageView.center.y = self.view.center.y - 100
                    self.trimImageView.center.x = self.view.center.x + 50
                    self.trimImageView.center.y = self.view.center.y - 100
                    
                } else if self.textField.text == "7 hours" {
                    
                    self.garageImageView.alpha = 0.0
                    self.trimImageView.alpha = 1.0
                    self.doorImageView.alpha = 0.0
                    self.faucetImageView.alpha = 0.0
                    self.paintImageView.alpha = 1.0
                    
                    self.paintImageView.center.x = self.view.center.x - 50
                    self.paintImageView.center.y = self.view.center.y - 100
                    self.trimImageView.center.x = self.view.center.x + 50
                    self.trimImageView.center.y = self.view.center.y - 100
                    
                } else if self.textField.text == "6 hours" {
                    
                    self.garageImageView.alpha = 1.0
                    self.trimImageView.alpha = 0.0
                    self.doorImageView.alpha = 1.0
                    self.faucetImageView.alpha = 0.0
                    self.paintImageView.alpha = 0.0
                    
                    self.garageImageView.center.x = self.view.center.x - 50
                    self.garageImageView.center.y = self.view.center.y - 100
                    self.doorImageView.center.x = self.view.center.x + 50
                    self.doorImageView.center.y = self.view.center.y - 100
                    
                } else if self.textField.text == "5 hours" {
                    
                    self.garageImageView.alpha = 0.0
                    self.trimImageView.alpha = 0.0
                    self.doorImageView.alpha = 1.0
                    self.faucetImageView.alpha = 0.0
                    self.paintImageView.alpha = 1.0
                    
                    self.paintImageView.center.x = self.view.center.x - 50
                    self.paintImageView.center.y = self.view.center.y - 100
                    self.doorImageView.center.x = self.view.center.x + 50
                    self.doorImageView.center.y = self.view.center.y - 100
                    
                } else if self.textField.text == "4 hours" {
                    
                    self.garageImageView.alpha = 0.0
                    self.trimImageView.alpha = 0.0
                    self.doorImageView.alpha = 0.0
                    self.faucetImageView.alpha = 1.0
                    self.paintImageView.alpha = 1.0
                    
                    self.paintImageView.center.x = self.view.center.x - 50
                    self.paintImageView.center.y = self.view.center.y - 100
                    self.faucetImageView.center.x = self.view.center.x + 50
                    self.faucetImageView.center.y = self.view.center.y - 100
                    
                } else if self.textField.text == "3 hours" {
                    
                    self.garageImageView.alpha = 0.0
                    self.trimImageView.alpha = 0.0
                    self.doorImageView.alpha = 1.0
                    self.faucetImageView.alpha = 1.0
                    self.paintImageView.alpha = 0.0
                    
                    self.faucetImageView.center.x = self.view.center.x - 50
                    self.faucetImageView.center.y = self.view.center.y - 100
                    self.doorImageView.center.x = self.view.center.x + 50
                    self.doorImageView.center.y = self.view.center.y - 100
                    
                } else if self.textField.text == "2 hours" {
                    
                    self.garageImageView.alpha = 0.0
                    self.trimImageView.alpha = 0.0
                    self.doorImageView.alpha = 1.0
                    self.faucetImageView.alpha = 0.0
                    self.paintImageView.alpha = 0.0
                    
                    self.doorImageView.center.x = self.view.center.x
                    self.doorImageView.center.y = self.view.center.y - 100
                    
                } else {
                    
                    self.garageImageView.alpha = 0.0
                    self.trimImageView.alpha = 0.0
                    self.doorImageView.alpha = 0.0
                    self.faucetImageView.alpha = 1.0
                    self.paintImageView.alpha = 0.0
                    
                    self.faucetImageView.center.x = self.view.center.x
                    self.faucetImageView.center.y = self.view.center.y - 100
                    
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

    @IBAction func didTapDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func didTapChooseAgain(sender: AnyObject) {
        
        UIView.animateWithDuration(1.0, delay: 0,
            options:[] , animations: { () -> Void in
                
                self.buttonHolderView.frame.origin.y = self.buttonHolderOrigin
                self.decidedView.frame.origin.y = self.decidedOrigin
                
                self.doorImageView.center = self.doorOriginalCenter
                self.doorImageView.alpha = 1.0
                
                self.faucetImageView.center = self.faucetOriginalCenter
                self.faucetImageView.alpha = 1.0
                
                self.garageImageView.center = self.garageOriginalCenter
                self.garageImageView.alpha = 1.0
                
                self.paintImageView.center = self.paintOriginalCenter
                self.paintImageView.alpha = 1.0
                
                self.trimImageView.center = self.trimOriginalCenter
                self.trimImageView.alpha = 1.0
                
            }, completion: { (Bool) -> Void in
        })
        
        circleBreak = 0
        
    }
}

