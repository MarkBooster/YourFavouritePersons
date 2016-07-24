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
        
    }
    
    func onPersonsLoaded(notif: AnyObject) {
        tableView.reloadData()
    }
    
}

