//
//  MealVC.swift
//  DietManager
//
//  Created by firat sezel on 02/01/16.
//  Copyright © 2016 firat sezel. All rights reserved.
//

import UIKit

class MealVC: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var curLabel: UILabel!
    @IBOutlet weak var dailyLabel: UILabel!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textCal: UITextField!
    
    var meals = [[AnyObject]]()
    var dailyMeal = [AnyObject]()
    
    var currentCal:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "woodback.jpg")!)
        /*defaults.removeObjectForKey("cal")
        defaults.removeObjectForKey("dailymeal")
        defaults.removeObjectForKey("meal")*/
        if defaults.objectForKey("dailymeal") != nil {
            dailyMeal = defaults.objectForKey("dailymeal") as! [AnyObject]
        }else{
            let date = NSDate()
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Day , .Month , .Year], fromDate: date)
            
            let month = components.month
            let day = components.day
            
            dailyMeal.append(day)
            dailyMeal.append(month)
        }
        if defaults.objectForKey("cal") != nil {
            curLabel.text = String(defaults.objectForKey("cal"))
            currentCal = Int(defaults.objectForKey("cal") as! Int)
        }else{
            curLabel.text = "0"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addMealAction(sender: UIButton) {
        if (textName.text != nil && textCal.text != nil){
            let name = String(textName.text!)
            let cal = Int(textCal.text!)
            
            currentCal += cal!
            defaults.setObject(currentCal, forKey: "cal")
            curLabel.text = String(defaults.objectForKey("cal"))
            
            dailyMeal.append(name)
            defaults.setObject(dailyMeal, forKey: "dailymeal")
            
           //
            
            textName.text = ""
            textCal.text = ""
        }
    }
    @IBAction func FinishAc(sender: UIButton) {
        meals.append(dailyMeal)
        defaults.setObject(meals, forKey: "meal")
        
        textName.text = ""
        textCal.text = ""
        
        defaults.removeObjectForKey("dailymeal")
    }
}
