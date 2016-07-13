//
//  TestViewController.swift
//  Can't Decide
//
//  Created by Kelly Bryant on 7/1/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {


    @IBOutlet weak var doorImageView: UIImageView!
    @IBOutlet weak var faucetImageView: UIImageView!
    @IBOutlet weak var garageImageView: UIImageView!
    @IBOutlet weak var trimImageView: UIImageView!
    @IBOutlet weak var paintImageView: UIImageView!
    
    @IBOutlet weak var buttonHolderView: UIView!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    
    //variable to keep track of the circle that was selected
    var selectedCircleIndex: Int = 0
    
    //variable to keep track of the time that was selected
    var selectedTimeIndex: Int = 0
    
    //animation duration variable
    var circleDuration: NSTimeInterval!
    var circleBreak: Int = 0
    
    // picker content
    //var pickOption = ["1 hour", "2 hours", "3 hours", "4 hours", "5 hours", "6 hours", "7 hours", "8 hours", "9 hours", "10 hours"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the cancel and choose again button border colors (can only so this programatically
        cancelButton.layer.borderColor = UIColor(red: 114/255, green: 186/255, blue: 69/255, alpha: 1.0).CGColor
        cancelButton.layer.borderWidth = 1
        //chooseAgain.layer.borderColor = UIColor(red: 114/255, green: 186/255, blue: 69/255, alpha: 1.0).CGColor
        //chooseAgain.layer.borderWidth = 1
        
        // apply field styles
        fieldStyle(textField)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func didTapCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
    
}
