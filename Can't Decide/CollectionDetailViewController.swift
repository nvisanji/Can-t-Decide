//
//  CollectionDetailViewController.swift
//  Can't Decide
//
//  Created by Kelly Bryant on 6/21/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class CollectionDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var collectionLabelCD: UILabel!
    @IBOutlet weak var descripLabelCD: UILabel!

    //view for adding 1st item
    @IBOutlet weak var addView: UIView!
    //view for adding 2+ items
    @IBOutlet weak var addMore: UIView!

    @IBOutlet weak var addItem2: UIButton!
    @IBOutlet weak var addItem: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    //vars to hold the collectiondata
    var collectionCD: String!
    var descripCD: String!
    
    //array that contains all item data
    var itemData: [String]!
    



    override func viewDidLoad() {
        super.viewDidLoad()
        
        //displaying collection information
        collectionLabelCD.text = collectionCD
        descripLabelCD.text = descripCD

    
        //set itemData array
       // print(itemData.count)
        itemData = []

        //titleStyle(collectionLabelCD)
        addBtnStyle(addItem)
        addBtnStyle(addItem2)
    
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        //condition to show/hide the states of CollectionDetail
        if itemData.isEmpty == true{
            addView.hidden = false
            addMore.hidden = true
        } else {
            addView.hidden = true
            addMore.hidden = false
        }

    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        
        if segue.identifier == "addItemCDSegue"{
            print("add")
            var addItemViewController = segue.destinationViewController as! AddItemViewController
            
            addItemViewController.collectionDetailViewController = self
        } else if segue.identifier == "editItemSegueCD"{

            
            var editCollectionViewController = segue.destinationViewController as! EditCollectionViewController
        
            editCollectionViewController.editCollectionEC = collectionLabelCD.text
            editCollectionViewController.editDescripEC = descripLabelCD.text
            
            editCollectionViewController.collectionDetailViewController = self
        } else if segue.identifier == "chooseSegueCD"{
            print("choose")
            //HOOK UP TO NADEEM'S CHOOSE VC HERE
//            var chooseViewController = segue.chooseViewController as! ChooseViewController
//            
//            chooseViewController.collectionDetailViewController = self
        
        } else if segue.identifier == "planSegueCD"{
            print("plan")
            //HOOK UP TO NADEEM'S PLAN VC HERE
//            var planViewController = segue.destinationViewController as! PlanViewController
//            
//            planViewController.collectionDetailViewController = self
            
        }

    }


    @IBAction func addBtn(sender: AnyObject) {
        performSegueWithIdentifier("addItemCDSegue", sender: self)

    }


    @IBAction func backBtn(sender: AnyObject) {
        print(sender)
        dismissViewControllerAnimated(true, completion: nil)
        //navigationController!.popViewControllerAnimated(true)
        
        
    }
    
    //number of rows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return itemData.count

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemRowPrototype", forIndexPath: indexPath) as! ItemTableViewCell
        var itemTimeDesc = itemData[indexPath.row].componentsSeparatedByString(", ")
        //print(itemTimeDesc)
        //print(itemTimeDesc.first)
        cell.itemLabel.text = itemTimeDesc.first
        itemTimeDesc.removeFirst()
        //print(itemTimeDesc.first)
        cell.descriptionLabel.text = itemTimeDesc.first
        //print(itemTimeDesc.last)
        cell.unitLabel.text = itemTimeDesc.last
        itemTimeDesc.removeLast()
        //print(itemTimeDesc.last)
        cell.timeLabel.text = itemTimeDesc.last
        
        
        return cell
    }
    
    //add item to itemData array
    func addToItemData(newItem: String){
        itemData.insert(newItem, atIndex: itemData.count)
    }
    
    
    
    func addBtnStyle(addBtn: UIButton){
        var borderColor : UIColor = UIColor(red: 76/255, green: 169/255, blue: 12/255, alpha: 1.0)
        var btnColor: UIColor = UIColor(white: 1, alpha: 1)
        addBtn.layer.borderWidth = 1.5
        addBtn.layer.borderColor = borderColor.CGColor
        addBtn.layer.backgroundColor = btnColor.CGColor

    }



}
