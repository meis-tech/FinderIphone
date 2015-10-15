//
//  SettingViewController.swift
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

class SettingViewController: UIViewController {
    
    @IBOutlet weak var proximityUUID: UITextField!
    @IBOutlet weak var UserKey: UITextField!
    @IBOutlet weak var UserPassword: UITextField!
    @IBOutlet weak var ServerEndPoint: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


