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
    @IBOutlet weak var cover: UIImageView!
    
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var DOB: UILabel!
    @IBOutlet weak var allergies: UILabel!
    @IBOutlet weak var blood: UILabel!
    @IBOutlet weak var medication: UILabel!
    @IBOutlet weak var chronic: UILabel!
    @IBOutlet weak var Orgon: UILabel!
    @IBOutlet weak var imageURL: UIImageView?
    @IBOutlet weak var notes: UITextField!
    @IBOutlet weak var condition: UITextField!
    
    
    var bec : beacon?
    var major : String?
    
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
        var Cloudinary:CLCloudinary
        Cloudinary = CLCloudinary(url: "cloudinary://284447624913469:es22vnmqabWTvibjnkZNzQhaYqE@dat999xkb")
        let uurl = NSURL(string: Cloudinary.url(bec!.image_name) as String)
        let data = NSData(contentsOfURL: uurl!)
        imageURL!.image = UIImage(data: data!)
        let datas = NSData(contentsOfURL:NSURL(string: "http://res.cloudinary.com/dat999xkb/image/upload/v1454394475/greg2_tlrbfd.jpg")!)
        cover!.image = UIImage(data: datas!)
    }
    
    func HTTPsendRequest(request: NSMutableURLRequest,callback: (String, String?) -> Void) {
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request,completionHandler :
            {
                data, response, error in
                print("WTF???");
                print(data);
                print(response);
                print(error);
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
        let note: String = notes.text!
        let condit: String = condition.text!
        
        let noteString = note.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
        let conditString = condit.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        print(conditString)
        
        print("ya bish?")
        print(note)
        print(condit)
        var urlString = "https://fathomless-inlet-3449.herokuapp.com"
        urlString += "/emergency_alerts/create_alert_modaly?id="
        urlString += bec!.major!
        urlString += "?"
        urlString += noteString
        urlString += "?"
        urlString += conditString
        
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
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestinationVC = segue.destinationViewController as! BeaconTableViewController
    }
}