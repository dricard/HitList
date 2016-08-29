//
//  ViewController.swift
//  HitList
//
//  Created by Denis Ricard on 2016-08-29.
//  Copyright © 2016 Hexaedre. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    // MARK: - Properties
    
    var names = [String]()
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addName(sender: AnyObject) {
        
        let alert = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: { (action: UIAlertAction) -> Void in
            
            let textField = alert.textFields!.first
            self.names.append(textField!.text!)
            self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction) -> Void in })
        
        alert.addTextFieldWithConfigurationHandler{ (textField: UITextField) -> Void in }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"The List\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView Data Source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel!.text = names[indexPath.row]
        
        return cell
    }


}

