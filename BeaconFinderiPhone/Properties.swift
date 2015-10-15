//
//  Properties.swift
//  BeaconFinder
//
//  Created by Alex Flohr on 9/26/15.
//  Copyright (c) 2015 Alex Flohr. All rights reserved.
//

import Foundation

class Properties {
    var proximityUUID: String?
    var UserKey: String?
    var UserPassword: String?
    var ServerEndPoint: String?
    
    func updateUUID (newUUID : String?) {
        proximityUUID = newUUID
    }
    
    func updateUserKey (newUserKey : String?) {
        UserKey = newUserKey
    }
    
    func updateUserPassword (newUserPassword: String?) {
        UserPassword = newUserPassword;
    }
    
    func newServerEndPoint (newEndPoint : String?) {
        ServerEndPoint = newEndPoint
    }
    
    init(endPoint : String) {
        self.ServerEndPoint = endPoint
    }
}
