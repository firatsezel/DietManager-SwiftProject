//
//  DailyHistoryVC.swift
//  DietManager
//
//  Created by firat sezel on 05/01/16.
//  Copyright © 2016 firat sezel. All rights reserved.
//

import UIKit

class DailyHistoryVC: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()

    var dailyShow = [AnyObject]()
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "woodback.jpg")!)
        if defaults.objectForKey("show") != nil {
            dailyShow = defaults.objectForKey("show") as! [AnyObject]
            
            for var x = 0; x < dailyShow.count; x++ {
                mealLabel.text! += dailyShow[x] as! String
                mealLabel.text! += "\n"
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
