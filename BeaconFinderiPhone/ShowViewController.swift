//
//  ShowViewController.swift
//  BeaconFinderiPhone
//
//  Created by Alex Flohr on 10/2/15.
//  Copyright © 2015 Alex Flohr. All rights reserved.
//

import Foundation
import UIKit

class ShowViewController : UIViewController {
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var DOB: UILabel!
    @IBOutlet weak var allergies: UILabel!
    @IBOutlet weak var blood: UILabel!
    @IBOutlet weak var medication: UILabel!
    @IBOutlet weak var chronic: UILabel!
    @IBOutlet weak var Orgon: UILabel!
    var bec : beacon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstname.text = bec!.first_name
        lastname.text = bec!.last_name
        DOB.text = bec!.DOB
        allergies.text = bec!.allergies
        blood.text = bec!.blood_type
        medication.text = bec!.medication
        chronic.text = bec!.chronic
        Orgon.text = bec!.organ_donor
    }
    
    func HTTPsendRequest(request: NSMutableURLRequest,callback: (String, String?) -> Void) {
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request,completionHandler :
            {
                data, response, error in
                if error != nil {
                    callback("", (error!.localizedDescription) as String)
                } else {
                    callback(NSString(data: data!, encoding: NSUTF8StringEncoding) as! String,nil)
                }
        })
        
        task.resume() //Tasks are called with .resume()
        
    }
    
    func HTTPGet(url: String, callback: (String, String?) -> Void) {
        let request = NSMutableURLRequest(URL: NSURL(string: url)!) //To get the URL of the receiver , var URL: NSURL? is used
        HTTPsendRequest(request, callback: callback)
    }
    
    @IBAction func Push(sender: AnyObject) {
        print("push was called")
        var urlString = "http://172.16.120.36:3000"
        urlString += "/emergency_alerts/create_alert_modaly?id=12"
        print(urlString)
        HTTPGet(urlString) {
            (data: String, error: String?) -> Void in
            if error != nil {
                print(data)
                print("we in")
                let myAlert = UIAlertView()
                myAlert.title = "Title"
                myAlert.message = "My message"
                myAlert.addButtonWithTitle("Ok")
                myAlert.delegate = self   
                myAlert.show()
            } else {
                print(error)
                print("faliure")
                let myAlert = UIAlertView()
                myAlert.title = "MEIS"
                myAlert.message = "Information has been pushed"
                myAlert.addButtonWithTitle("Ok")
                myAlert.delegate = self
                myAlert.show()

            }
        }
        sleep(4)
    }
}