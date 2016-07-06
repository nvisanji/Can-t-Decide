//
//  SampleCollectionDetailViewController.swift
//  Can't Decide
//
//  Created by Kelly Bryant on 6/30/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class SampleCollectionDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//class CollectionDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var collectionLabelCD: UILabel!
    @IBOutlet weak var descripLabelCD: UILabel!
    
    //view for adding 1st item
    @IBOutlet weak var addView: UIView!
    //view for adding 2+ items
    @IBOutlet weak var addMore: UIView!
    
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
        //collectionLabelCD.text = collectionCD
        //descripLabelCD.text = descripCD
        
        //collectionLabelCD.text = "House projects"
        //descripLabelCD.text = "Little and big to-do's around the house"
        
        collectionLabelCD.text = "Dinner"
        descripLabelCD.text = "Quick and easy recipes"

        
        
        itemData = ["Spaghetti and meatballs, Trader Joe's meatballs, 50, minutes", "Chicken with rice, , 60, minutes", "Gyoza, Silas' favorite, 30, minutes", "Scrambled eggs, , 15, minutes", "Turkey burgers, Todd's specialty, 45, minutes"]
        
        
        //titleStyle(collectionLabelCD)
        addBtnStyle(addItem)
        
        
        
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
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        print(segue.identifier)
//        
//        if segue.identifier == "addItemCDSegue"{
//            print("add")
//            var addItemViewController = segue.destinationViewController as! AddItemViewController
//            
//           // addItemViewController.collectionDetailViewController = self
//        } else if segue.identifier == "editItemSegueCD"{
//            
//            
//            var editCollectionViewController = segue.destinationViewController as! EditCollectionViewController
//            
//            print("check if data is going in")
//            print(collectionLabelCD.text)
//            print(descripLabelCD.text)
//            
//            
//            
//            
//            editCollectionViewController.editCollectionEC = collectionLabelCD.text
//            editCollectionViewController.editDescripEC = descripLabelCD.text
//            
//          //  editCollectionViewController.collectionDetailViewController = self
//        } else if segue.identifier == "testSegue"{
//            print("choose")
//            //HOOK UP TO NADEEM'S CHOOSE VC HERE
//            //chooseSegueCD
//            
//            var testViewController = segue.destinationViewController as! TestViewController
//            //            var chooseViewController = segue.chooseViewController as! ChooseViewController
//            //
//            //            chooseViewController.collectionDetailViewController = self
//            
//        } else if segue.identifier == "planSegueCD"{
//            print("plan")
//            //HOOK UP TO NADEEM'S PLAN VC HERE
//            //            var planViewController = segue.destinationViewController as! PlanViewController
//            //
//            //            planViewController.collectionDetailViewController = self
//            
//        }
//        
//    }
    

    
    

    
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

    
    
    @IBAction func addBtn(sender: AnyObject) {
        //performSegueWithIdentifier("addItemCDSegue", sender: self)
        
    }
    
    @IBAction func chooseBtn(sender: AnyObject) {        //performSegueWithIdentifier("testSegue", sender: self)
        performSegueWithIdentifier("chooseSegue", sender: self)
    }
    
    @IBAction func backBtn(sender: AnyObject) {
        //dismissViewControllerAnimated(true, completion: nil)
        navigationController!.popViewControllerAnimated(true)
        
    }
    
    
    @IBAction func onBackHome(sender: AnyObject) {
        print("go home")
        //dismissViewControllerAnimated(true, completion: nil)
        navigationController!.popViewControllerAnimated(true)
    }
    
    func addBtnStyle(addBtn: UIButton){
        var borderColor : UIColor = UIColor(red: 76/255, green: 169/255, blue: 12/255, alpha: 1.0)
        var btnColor: UIColor = UIColor(white: 1, alpha: 1)
        addBtn.layer.borderWidth = 1.5
        addBtn.layer.borderColor = borderColor.CGColor
        addBtn.layer.backgroundColor = btnColor.CGColor
        
    }
    
}

