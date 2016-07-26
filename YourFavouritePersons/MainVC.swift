//
//  ViewController.swift
//  YourFavouritePersons
//
//  Created by Mark Booster on 24-07-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var persons = [Person]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DataService.instance.loadPersons()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MainVC.onPersonsLoaded(_:)), name: "personsLoaded", object: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPersons.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let person = DataService.instance.loadedPersons[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("PersonCell") as? PersonCell {
            cell.configureCell(person)
            return cell
        } else {
            let cell = PersonCell()
            cell.configureCell(person)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var person: Person
        person = DataService.instance.loadedPersons[indexPath.row]
        performSegueWithIdentifier("PersonDetailVC", sender: person)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PersonDetailVC" {
            if let personDetailVC = segue.destinationViewController as? PersonDetailVC {
                if let person = sender as? Person {
                    personDetailVC.person = person
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            DataService.instance.loadedPersons.removeAtIndex(indexPath.row)
            DataService.instance.savePersons()
            DataService.instance.loadPersons()
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deletebutton = UITableViewRowAction(style: .Normal, title: "Delete", handler: { (action, indexPath) in
            self.tableView.dataSource?.tableView?(self.tableView, commitEditingStyle: .Delete, forRowAtIndexPath: indexPath)
            
            return
        })
        
        deletebutton.backgroundColor = UIColor(red: 0.757, green: 0.129, blue: 0.169, alpha: 1.00)
        
        return [deletebutton]

    }

    
    func onPersonsLoaded(notif: AnyObject) {
        tableView.reloadData()
    }
    
}

