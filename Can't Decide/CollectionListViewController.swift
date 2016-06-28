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
    
    var collectionList: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionList = ["Projects, An example of how to use Can't Decide", "second, thing"]
        listTableCL.dataSource = self
        listTableCL.delegate = self
        listTableCL.reloadData()

        // Do any additional setup after loading the view.
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
        let cell = listTableCL.dequeueReusableCellWithIdentifier("CollectionListCell", forIndexPath: indexPath) as! CollectionListTableViewCell
        var nameDescCL = collectionList[indexPath.row].componentsSeparatedByString(", ")

        cell.collectionNameLabel.text = nameDescCL.first
        cell.collectionDescriptionLabel.text = nameDescCL.last
        
        return cell
    }

}
