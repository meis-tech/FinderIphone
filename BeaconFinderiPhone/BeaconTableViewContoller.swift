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

// , CLLocationManagerDelegate
class BeaconTableViewController : UITableViewController {
    var ourBeacons : [CLBeacon] = []
    var items = [beacon]()
    var indexOfSelectedPerson = 0;
    var MYbeacons : [CLBeacon] = []
    var users : NSArray = [];
    var Myusers : NSArray = [];
    
// IBEACON
//        let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("we INT TABLE VIEW CONTRL")
        //       BLE-STANDARD
        let uuidStr: String = "B9407F30-F5F8-466E-AFF9-25556B57FE99"
        let uuid: CBUUID = CBUUID(string:uuidStr)
        let discovery: Discovery = Discovery(UUID: uuid, username: "FirstResponder-Searchlight") { (users,usersChanged) -> Void in
            print("BLEStandard - Found:",users.count)
            // this reload logic is dangerous and unrealable!!!!
            var reload : Bool = false;
            if (self.Myusers.count != users.count) {
                reload = true;
            }
            self.Myusers = users
            dispatch_async(dispatch_get_main_queue()) {
                if (reload) {
                    self.tableView.reloadData()
                }
            }
        }
    }

// ALL IBEACON
//        let string:String = "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6"
//        let beaconUUID:NSUUID? = NSUUID(UUIDString: string)
//        let region = CLBeaconRegion(proximityUUID: beaconUUID! , identifier: "yaya")
//        
//        locationManager.delegate = self;
//        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
//            locationManager.requestWhenInUseAuthorization()
//            print("should've requested")
//        }
//        locationManager.startRangingBeaconsInRegion(region)
//    }
    
//
//    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion){
//        // this reload logic is dangerous!!!!
//        var reload : Bool = false;
//        if (beacons.count != MYbeacons.count) {
//            reload = true;
//        }
//        MYbeacons = beacons
//        print("iBeacon2-")
//        print(beacons)
//        if (reload) {
//            items = [];
//            self.tableView.reloadData()
//        }
//    }
// ALL IBEACON
    
    func viewDidAppear() {
        print("did appear");
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Myusers.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("reload table");
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            print("we put into queue")
            let currentbec = beacon(major : self.Myusers[indexPath.row].username)
            print("username in queueu: %s",self.Myusers[indexPath.row].username );
//            let currentbec = beacon(minor : self.MYbeacons[indexPath.row].minor, major : self.MYbeacons[indexPath.row].major)
            dispatch_async(dispatch_get_main_queue()) {
                print("we spit out of queueu");
//                print("%s",currentbec.first_name);
                
                    var name : String
                print("we chillen2");
                if(currentbec.first_name == nil) {
                    sleep(10)
                    print("we chillen");
                }
                print("we chillen2");
                    name = currentbec.first_name!
                    name += " "
                    name += currentbec.last_name!
                    cell.textLabel?.text = name
            
                    var Cloudinary:CLCloudinary
                    Cloudinary = CLCloudinary(url: "cloudinary://284447624913469:es22vnmqabWTvibjnkZNzQhaYqE@dat999xkb")
                    let uurl = NSURL(string: Cloudinary.url(currentbec.image_name) as String)
                    let data = NSData(contentsOfURL: uurl!)
                    cell.imageView!.image = UIImage(data: data!)
                    self.items.append(currentbec);
                    self.items[indexPath.row] = currentbec;
            }
        }
//        cell.textLabel?.text = name
        return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            let cell = (sender as! UITableViewCell)
            print("%s", cell.textLabel?.text)
            let path = self.tableView.indexPathForCell(cell)
            let row = path?.row
            print("%s", row)
            let sendbec = items[row!]
            let DestinationVC = segue.destinationViewController as! ShowViewController
            DestinationVC.bec = sendbec
//        }
    }
}