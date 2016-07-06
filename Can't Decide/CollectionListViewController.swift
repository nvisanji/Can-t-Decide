//
//  CollectionListViewController.swift
//  Can't Decide
//
//  Created by Kelly Bryant on 6/21/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class CollectionListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var listTableCL: UITableView!
    @IBOutlet weak var appName: UILabel!
    
    @IBOutlet var addCatBtn: UIButton!
    
    var collectionList: [String]!
    
   // var sampleCollectionDetailViewController: SampleCollectionDetailViewController!
    
    var sampleCollectionDetailViewController: SampleCollectionDetailViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setting up the list of categories
        collectionList = ["Dinner, Quick and easy recipes", "House projects, Little and big to-do's around the house"]
        
        //for the table view
        listTableCL.dataSource = self
        listTableCL.delegate = self
        listTableCL.reloadData()

        
        addBtnStyle(addCatBtn)
        
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
    
    
    //number of rows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return collectionList.count
        
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //setting up the table rows
        let cell = listTableCL.dequeueReusableCellWithIdentifier("CollectionListCell", forIndexPath: indexPath) as! CollectionListTableViewCell
        var nameDescCL = collectionList[indexPath.row].componentsSeparatedByString(", ")

        cell.collectionNameLabel.text = nameDescCL.first
        cell.collectionDescriptionLabel.text = nameDescCL.last
        
        
        //TAPACTION on selected tableview cell

        cell.tapAction = { (cell) in
            //print((self.listTableCL.indexPathForCell(cell)!.row))
            
            var selectedCell = self.listTableCL.indexPathForCell(cell)!.row

            //print(selectedCell)
            if selectedCell == 0{
                //goes to dinner list
                //self.performSegueWithIdentifier("dinnerPOCSegue", sender: self)
                self.performSegueWithIdentifier("sampleSegueOne", sender: self)
                
            } else if selectedCell == 1 {
                //goest to house list
                self.performSegueWithIdentifier("sampleSegueTwo", sender: self)
            }
            
        }
        
        //GESTURE on selected tableview cell
        cell.panAction = { (cell) in
            //self.performSegueWithIdentifier("testdelegateSegue", sender: UILongPressGestureRecognizer())
            var selectedCell = self.listTableCL.indexPathForCell(cell)!.row
            
        }
        
        //TAP CHOOSE GOES TO CHOOSE SEGUE
        cell.chooseAction = { (cell) in

            var selectedCell = self.listTableCL.indexPathForCell(cell)!.row
            
            if selectedCell == 0 {
                //open choose for dinner
                //self.performSegueWithIdentifier("testSegueFromHome", sender: self)
                self.performSegueWithIdentifier("chooseSegueFromHome", sender: self)
            } else {
                //do nothing yet
            }
            
        }
        
        //TAP PLAN GOES TO PLAN SEGUE
        cell.planAction = { (cell) in
            
            var selectedCell = self.listTableCL.indexPathForCell(cell)!.row
            
            if selectedCell == 1 {
                //open plan for home projects - segue would be different then above
                self.performSegueWithIdentifier("testSegueFromHome", sender: self)
            } else {
                //do nothing yet
            }
            
        }
        
        //DELETE ACTION
        cell.deleteAction = { (cell) in
            var selectedCell = self.listTableCL.indexPathForCell(cell)!.row
            
            //self.collectionList.removeAtIndex(selectedCell)

            
        }
        
        return cell
    }
    

    //add item to itemData array
    func addToCollectionList(newItem: String){
        collectionList.insert(newItem, atIndex: collectionList.count)
    }
    
    func addBtnStyle(addBtn: UIButton){
        var borderColor : UIColor = UIColor(red: 76/255, green: 169/255, blue: 12/255, alpha: 1.0)
        var btnColor: UIColor = UIColor(white: 1, alpha: 1)
        addBtn.layer.borderWidth = 1.5
        addBtn.layer.borderColor = borderColor.CGColor
        addBtn.layer.backgroundColor = btnColor.CGColor
        
    }


}
