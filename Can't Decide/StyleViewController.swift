//
//  StyleViewController.swift
//  Can't Decide
//
//  Created by Kelly Bryant on 6/29/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class StyleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func fieldStyle(textField: UITextField){
        var borderColor : UIColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        textField.layer.borderWidth = 0.7
        textField.layer.borderColor = borderColor.CGColor
        textField.layer.cornerRadius = 5.0
        
        textField.font = UIFont(name: "Activ Grotesk", size: 14)
        
        
        
    }

}
