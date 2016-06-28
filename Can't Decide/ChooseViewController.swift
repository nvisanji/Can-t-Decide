//
//  ChooseViewController.swift
//  Can't Decide
//
//  Created by Nadeem Visanji on 6/21/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {

    @IBOutlet weak var spaImageView: UIImageView!
    @IBOutlet weak var eggsImageView: UIImageView!
    @IBOutlet weak var gyozaImageView: UIImageView!
    @IBOutlet weak var chickenImageView: UIImageView!
    @IBOutlet weak var turkeyImageView: UIImageView!
    @IBOutlet weak var buttonHolderView: UIView!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    var selectedImageView: UIImageView!
    var circleOriginalCenter: CGPoint!
    
    //variable to keep track of the circle that was selected
    var selectedCircleIndex: Int = 0
    
    //variable to keep track of the time that was selected
    var selectedTimeIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the cancel button border color (can only so this programatically
        cancelButton.layer.borderColor = UIColor(red: 114/255, green: 186/255, blue: 69/255, alpha: 1.0).CGColor
        
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
        
        var destinationViewController = segue.destinationViewController as! ContentViewController
        
        // send the proper index value to the content view controller based on the circle that was selected
        destinationViewController.theCircleIndex = selectedCircleIndex
        
    }
    
    // Get the selected button for time. This will decide which circle to show after the selection animation.
    
    // Trigger the selection animation on tap of "decide for me"
    @IBAction func didTapDecide(sender: AnyObject) {
        
        moveToSpace()
        delay(1.0) {
           
            UIView.animateWithDuration(2.0, delay: 0.0,
                // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
                options: [], animations: { () -> Void in
                    
                    self.spa()
                    
                }, completion: nil )
        }
        
        
    }
    
    func moveToSpace() {
        
        UIView.animateWithDuration(1.0, delay: 0,
            options:[] , animations: { () -> Void in
                self.buttonHolderView.frame.origin.y += self.buttonHolderView.frame.origin.y + 100
                self.spaImageView.frame.origin = CGPointMake(116, 116)
                self.eggsImageView.frame.origin = CGPointMake(207, 200)
                self.turkeyImageView.frame.origin = CGPointMake(176, 308)
                self.chickenImageView.frame.origin = CGPointMake(60, 308)
                self.gyozaImageView.frame.origin = CGPointMake(20, 200)
            }, completion: { (Bool) -> Void in
        })
        
    }
    
    func animateCircles() {
        
        
        
        /*
        UIView.animateWithDuration(4.0, delay: 0.0,
            // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
            options: [UIViewAnimationOptions.Repeat], animations: { () -> Void in
                
                UIView.animateWithDuration(0.2, delay: 0.0,
                    // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
                    options: [], animations: { () -> Void in
                        
                        self.spaImageView.alpha = 0.2
                        
                }, completion: nil)
                
                UIView.animateWithDuration(0.2, delay: 0.0,
                    // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
                    options: [], animations: { () -> Void in
                        
                        self.eggsImageView.alpha = 0.2
                        
                }, completion: nil)
                
            }, completion: nil)
        
        UIView.animateWithDuration(4.0, delay: 0.0,
            // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
            options: [UIViewAnimationOptions.Repeat, UIViewAnimationOptions.Autoreverse], animations: { () -> Void in
                
                self.spaImageView.alpha = 0.2
                self.eggsImageView.alpha = 0.2
                
        }, completion: nil)
        */
        
    }
    
    func spa() {
        
        UIView.animateWithDuration(1.0,
           animations: {
              self.spaImageView.alpha = 0.2
              self.eggsImageView.alpha = 1.0
           },
           completion: { finished in self.eggs() }
        )
        
        /*
        self.spaImageView.alpha = 1.0
        self.eggsImageView.alpha = 0.5
        self.turkeyImageView.alpha = 0.5
        self.chickenImageView.alpha = 0.5
        self.gyozaImageView.alpha = 0.5
        */

    }
    
    func eggs() {
        
        UIView.animateWithDuration(1.0,
            animations: {
               self.spaImageView.alpha = 1.0
               self.eggsImageView.alpha = 0.2
            },
            completion: { finished in self.spa() }
        )
        
        /*
        self.spaImageView.alpha = 0.5
        self.eggsImageView.alpha = 1.0
        self.turkeyImageView.alpha = 0.5
        self.chickenImageView.alpha = 0.5
        self.gyozaImageView.alpha = 0.5
        */
        //self.turkey()
    }
    
    func turkey() {
        /*
        self.spaImageView.alpha = 0.5
        self.eggsImageView.alpha = 0.5
        self.turkeyImageView.alpha = 1.0
        self.chickenImageView.alpha = 0.5
        self.gyozaImageView.alpha = 0.5
        */
        print("turkey")
        self.chicken()
    }
    
    func chicken() {
        /*
        self.spaImageView.alpha = 0.5
        self.eggsImageView.alpha = 0.5
        self.turkeyImageView.alpha = 0.5
        self.chickenImageView.alpha = 1.0
        self.gyozaImageView.alpha = 0.5
        */
        print("chicken")
        self.gyoza()
    }
    
    func gyoza() {
        /*
        self.spaImageView.alpha = 0.5
        self.eggsImageView.alpha = 0.5
        self.turkeyImageView.alpha = 0.5
        self.chickenImageView.alpha = 0.5
        self.gyozaImageView.alpha = 1.0
        */
        print("gyoza")
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    

}
