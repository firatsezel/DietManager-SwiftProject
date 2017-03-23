//
//  HistoryVC.swift
//  DietManager
//
//  Created by firat sezel on 29/12/15.
//  Copyright © 2015 firat sezel. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var meals = [[AnyObject]]()
    var dailyMeal = [AnyObject]()
    var activity2d = [[AnyObject]]()
    var dailyShow = [AnyObject]()
    
    enum ActionSheetTag: Int {
        case ActionSheet1
        case ActionSheet2
    }
    
    var dIndex:Int = 0
    var mIndex:Int = 0
    var data: [AnyObject] = []
    var monthData: [AnyObject] = ["January", "February","March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

    @IBOutlet weak var datePicker: UIPickerView!
    @IBOutlet weak var mData: UIPickerView!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "woodback.jpg")!)
        datePicker.tag = ActionSheetTag.ActionSheet1.rawValue
        mData.tag = ActionSheetTag.ActionSheet2.rawValue
        var count:Int = 0
        while(count < 30){
            count++
            data.append(count)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let tag = ActionSheetTag(rawValue: pickerView.tag) {
            switch tag {
            case .ActionSheet1:
                return data.count
            case .ActionSheet2:
                return monthData.count
            }
        }else{
            return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
        if let tag = ActionSheetTag(rawValue: pickerView.tag) {
            switch tag {
            case .ActionSheet1:
                return String(data[row])
            case .ActionSheet2:
                return monthData[row] as! String
            }
        }else{
            return ""
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let tag = ActionSheetTag(rawValue: pickerView.tag) {
            switch tag {
            case .ActionSheet1:
                dIndex = row
                dLabel.text = String(data[row])
            case .ActionSheet2:
                mIndex = row
                mLabel.text = monthData[row] as? String
            }
        }
    }
    
    @IBAction func ShowAction(sender: UIButton) {
        dIndex++
        mIndex++
        
        //meals = defaults.objectForKey("dailymeal") as! [AnyObject]
        
        meals = defaults.objectForKey("meal") as! [[AnyObject]]
        activity2d = defaults.objectForKey("activity") as! [[AnyObject]]
        
        for var x = 0; x < meals.count; x++ {
            if String(meals[x][0]) == String(dIndex) {
                if String(meals[x][1]) == String(mIndex){
                    for var y = 2; y < meals[x].count; y++ {
                        dailyShow.append(String(meals[x][y]))
                    }
                    break
                }
            }
        }
        
        for var x = 0; x < activity2d.count; x++ {
            if String(activity2d[x][0]) == String(dIndex) {
                print("gun bulduk")
                if String(activity2d[x][1]) == String(mIndex){
                    print("gun bulduk")
                    for var y = 2; y < activity2d[x].count; y++ {
                        dailyShow.append(String(activity2d[x][y]))
                    }
                    break
                }
            }
        }
        
        defaults.setObject(dailyShow, forKey: "show")
    }
}
