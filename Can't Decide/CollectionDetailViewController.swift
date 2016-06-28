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
    
    @IBOutlet weak var addItem: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    //vars to hold the collectiondata
    var collectionCD: String!
    var descripCD: String!
    
    //array that contains all item data
    var itemData: [String]!
    
    //check what button pressed
    var buttonPressed: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //displaying collection information
        collectionLabelCD.text = collectionCD
        descripLabelCD.text = descripCD
        
        
        //set itemData array
        // print(itemData.count)
        itemData = []
        
        
        
        
        
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
    
    @IBAction func didPressEdit(sender: AnyObject) {
        buttonPressed = "edit"
    }
    
    @IBAction func didPressAdd(sender: AnyObject) {
        buttonPressed = "add"
    }
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        var addItemViewController = segue.destinationViewController as! AddItemViewController
        
        
        addItemViewController.collectionDetailViewController = self
        
        print("edit segue")
        
        //        var editItemViewController = segue.destinationViewController as! EditCollectionViewController
        //        editItemViewController.collectionDetailViewController = self
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    
    
    @IBAction func backBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //number of rows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return itemData.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemRowPrototype", forIndexPath: indexPath) as! ItemTableViewCell
        var itemTimeDesc = itemData[indexPath.row].componentsSeparatedByString(", ")
        print(itemTimeDesc)
        print(itemTimeDesc.first)
        cell.itemLabel.text = itemTimeDesc.first
        itemTimeDesc.removeFirst()
        print(itemTimeDesc.first)
        cell.descriptionLabel.text = itemTimeDesc.first
        print(itemTimeDesc.last)
        cell.unitLabel.text = itemTimeDesc.last
        itemTimeDesc.removeLast()
        print(itemTimeDesc.last)
        cell.timeLabel.text = itemTimeDesc.last
        
        
        return cell
    }
    
    //add item to itemData array
    func addToItemData(newItem: String){
        itemData.insert(newItem, atIndex: itemData.count)
    }
    
    
}

