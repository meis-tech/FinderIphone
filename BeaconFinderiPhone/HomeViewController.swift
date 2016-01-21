//
//  HomeViewController.swift
//  BeaconFinder
//
//  Created by Alex Flohr on 9/26/15.
//  Copyright (c) 2015 Alex Flohr. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import AVFoundation
import CoreBluetooth

class HomeViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var numberOfbecs: UILabel!
    @IBOutlet weak var numberOfBLEs: UILabel!
    
    let locationManager = CLLocationManager()
//    var item = ["shit","a","brick"]
    var items : [beacon] = []
    var MYbeacons : [CLBeacon] = []
    var users : NSArray = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HEELO");
        
        //BLE-STANDARD
//        let uuidStr: String = "B9407F30-F5F8-466E-AFF9-25556B57FE99"
//        let uuid: CBUUID = CBUUID(string:uuidStr)
//        let discovery: Discovery = Discovery(UUID: uuid, username: "DANie") { (users, usersChanged) -> Void in
//            print("BLEStandard - Found:",users.count)
//            dispatch_async(dispatch_get_main_queue()) {
//            self.numberOfBLEs.text = String(users.count)
//                if (users.count > 0 ) {
//                    print(users[0].username);
//                }
//            }
//        }
        
        //IBEACON
//        let string:String = "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6"
//        let beaconUUID:NSUUID? = NSUUID(UUIDString: string)
//        let region = CLBeaconRegion(proximityUUID: beaconUUID! , identifier: "yaya")
//
//        var settings : Properties
//        settings = Properties(endPoint : "http://128.61.64.146:3000")
//        locationManager.delegate = self;
//        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
//            locationManager.requestWhenInUseAuthorization()
//            print("should've requested")
//        }
//        locationManager.startRangingBeaconsInRegion(region)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let tvc = segue.destinationViewController as! BeaconTableViewController
        print("WE GOING IN!")
        print(items.count)
        tvc.ourBeacons = MYbeacons
    }
    
    @IBAction func returnfromConfigure (segue : UIStoryboardSegue) {
        if segue.identifier == "BackSegue" {
            
        }
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion){
//        numberOfbecs.text = String(beacons.count)
//        MYbeacons = beacons
//        print("iBeacon-")
//        print(beacons)
    }
}


