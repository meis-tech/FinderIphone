//
//  BeaconTableViewContoller.swift
//  BeaconFinderiPhone
//
//  Created by Alex Flohr on 9/27/15.
//  Copyright © 2015 Alex Flohr. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class BeaconTableViewController : UITableViewController {
    var ourBeacons : [CLBeacon] = []
    var items : [beacon] = []
    var indexOfSelectedPerson = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("we INT TABLE VIEW CONTRL")
        print(ourBeacons.count)
        var currentbec : beacon
        for bec in ourBeacons {
            currentbec = beacon(minor : bec.minor, major : bec.major)
            items += [currentbec]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as! UITableViewCell
        let item = items[indexPath.row]
        var name : String
        name = item.first_name!
        name += " "
        name += item.last_name!
        cell.textLabel?.text = name
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        indexOfSelectedPerson = indexPath.row
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let cell = sender as? UITableView {
//            let i = redditListTableView.indexPathForCell(cell)!.row
            let sendbec = items[indexOfSelectedPerson]
            let DestinationVC = segue.destinationViewController as! ShowViewController
            DestinationVC.bec = sendbec
//        }
    }
}