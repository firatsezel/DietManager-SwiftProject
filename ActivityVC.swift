//
//  ActivityVC.swift
//  DietManager
//
//  Created by firat sezel on 05/01/16.
//  Copyright © 2016 firat sezel. All rights reserved.
//

import UIKit

class ActivityVC: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var countData: Int = 0
    var activity = [AnyObject]()
    var activity2d = [[AnyObject]]()
    var activityData = ["Running", "Walking", "Basketball", "Swimming", "Dance", "Cycling", "Other"]

    @IBOutlet weak var activityPicker: UIPickerView!
    
    @IBOutlet weak var minutes: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "woodback.jpg")!)
        /*defaults.removeObjectForKey("dailyact")
        defaults.removeObjectForKey("activity")*/
        if defaults.objectForKey("dailyact") != nil {
            activity = defaults.objectForKey("dailyact") as! [AnyObject]
        }else{
            let date = NSDate()
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Day , .Month , .Year], fromDate: date)
            
            let month = components.month
            let day = components.day
            
            activity.append(day)
            activity.append(month)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func SendActivitiesAction(sender: UIButton) {
        activity.append(activityData[countData])
        defaults.setObject(activity, forKey: "dailyact")
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activityData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
        return String(activityData[row])
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countData = row
    }
    
    @IBAction func FinishAc(sender: UIButton) {
        activity2d.append(activity)
        defaults.setObject(activity2d, forKey: "activity")
        
        defaults.removeObjectForKey("dailyact")
    }
}
