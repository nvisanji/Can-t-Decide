//
//  CollectionListTableViewCell.swift
//  Can't Decide
//
//  Created by Kelly Bryant on 6/26/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class CollectionListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionDescriptionLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    
    @IBOutlet weak var cellContentView: UIView!
    
    @IBOutlet weak var actionView: UIView!
    
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var chooseBtn: UIButton!
    @IBOutlet weak var planBtn: UIButton!
    
    
    var panAction: ((UITableViewCell) -> Void)?
    var tapAction: ((UITableViewCell) -> Void)?
    var chooseAction: ((UITableViewCell) -> Void)?
    var planAction: ((UITableViewCell) -> Void)?
    var deleteAction: ((UITableViewCell) -> Void)?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onPan:")
        cellContentView.addGestureRecognizer(panGestureRecognizer)
        panGestureRecognizer.delegate = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func didTapAdd(sender: AnyObject) {
        tapAction?(self)
        
    }
    
    @IBAction func didTapDelete(sender: AnyObject) {
        //print("delete")
        deleteAction?(self)
    }
    
    @IBAction func didTapChoose(sender: AnyObject) {
        //print("choose")
        chooseAction?(self)

    }
    
    @IBAction func didTapPlan(sender: AnyObject) {
        //print("Plan")
        planAction?(self)
    }
    
    
    
    func onPan(sender: UIPanGestureRecognizer) {
       
        
        var point = sender.locationInView(cellContentView)
        var velocity = sender.velocityInView(cellContentView)
        var translation = sender.translationInView(cellContentView)
        
        if sender.state == UIGestureRecognizerState.Began {
            
            
        } else if sender.state == UIGestureRecognizerState.Changed {


            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            UIView.animateWithDuration(0.4, delay: 0.0,
                options: [], animations: { () -> Void in
            if velocity.x > 0{
                if self.cellContentView.frame.origin.x < 0{
                    self.cellContentView.frame.origin = CGPoint(x: 0, y:0)
                } else {
                    self.cellContentView.frame.origin = CGPoint(x: 105, y: 0)
                }
            } else if velocity.x < 0 {
                if self.cellContentView.frame.origin.x > 0{
                   self.cellContentView.frame.origin = CGPoint(x: 0, y:0)
                } else {
                    self.cellContentView.frame.origin = CGPoint(x: -180, y: 0)
                }
            }
                    
                    
                }, completion: { (Bool) -> Void in

            })
            
        }
        
        
        panAction?(self)
    }
    
    
    
}
