//
//  WaterVC.swift
//  DietManager
//
//  Created by firat sezel on 02/01/16.
//  Copyright © 2016 firat sezel. All rights reserved.
//

import UIKit

class WaterVC: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    enum ActionSheetTag: Int {
        case ActionSheet1
        case ActionSheet2
    }
    
     var data: [AnyObject] = ["01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00", "00:00"]
    
    @IBOutlet weak var fClock: UIPickerView!
    @IBOutlet weak var sClock: UIPickerView!
    @IBOutlet weak var dailyLabel: UILabel!
    @IBOutlet weak var waterHourLabel: UILabel!
    var first:Int = 0
    var second:Int = 0
    var waterNeed:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "woodback.jpg")!)
        //self.view.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        if defaults.objectForKey("hour") != nil {
            waterHourLabel.text = String(defaults.objectForKey("hour"))
        }
        waterNeed = Float(defaults.objectForKey("water") as! Float)
        dailyLabel.text = String(Int(waterNeed))
        fClock.tag = ActionSheetTag.ActionSheet1.rawValue
        sClock.tag = ActionSheetTag.ActionSheet2.rawValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
        
        return String(data[row])
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let tag = ActionSheetTag(rawValue: pickerView.tag) {
            switch tag {
            case .ActionSheet1:
               first = row
            case .ActionSheet2:
               second = row
            }
        }
    }
    
    @IBAction func sendWaterAction(sender: UIButton) {
        var result:Int = 0
        if first > second {
            result = 24 - (first - second)
            waterHourLabel.text = String(Int((waterNeed) / Float(result)))
            defaults.setObject(Int((waterNeed) / Float(result)), forKey: "hour")
        }else if first == second {
            waterHourLabel.text = "None"
        }else{
            result = second - first
            waterHourLabel.text = String(Int((waterNeed) / Float(result)))
            defaults.setObject(Int((waterNeed) / Float(result)), forKey: "hour")
        }
        
        let settings = UIApplication.sharedApplication().currentUserNotificationSettings()
        
        if settings!.types == .None {
            let ac = UIAlertController(title: "Can't schedule", message: "Either we don't have permission to schedule notifications, or we haven't asked yet.", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
            return
        }

        
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.alertBody = "Drink Some Water! You Need \"\(waterHourLabel.text)\" More"
        notification.alertAction = "Water!"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["CustomField1": "w00t"]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }

    @IBAction func FreeAc(sender: UIButton) {
        defaults.removeObjectForKey("water")
        defaults.removeObjectForKey("cal")
        defaults.removeObjectForKey("dailyact")
        defaults.removeObjectForKey("activity")
        defaults.removeObjectForKey("dailymeal")
        defaults.removeObjectForKey("meal")
    }

}
