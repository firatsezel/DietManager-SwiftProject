//
//  StartPageVC.swift
//  DietManager
//
//  Created by firat sezel on 24/12/15.
//  Copyright © 2015 firat sezel. All rights reserved.
//

/*
import UIKit

class StartPageVC: UIViewController {
    
    
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var heatText: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendAction(sender: UIButton) {
        let heat:String =   heatText.titleForSegmentAtIndex(heatText.selectedSegmentIndex)!
    
        var age = Int(ageText.text!)
        var height = Int(heightText.text!)
        var weight=Int(weightText.text!)
        
        if age<10 || age>110 {
        
            let alertController = UIAlertController(title: "Age Alert", message:
                "Please enter age between 10-100 !", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            ageText.text=""
        
        }else if height<100 || age>280 {
            
            let alertController = UIAlertController(title: "Height Alert", message:
                "Please enter height between 100-280 !", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            ageText.text=""
            
        }else if weight<25 || weight>250 {
            
            let alertController = UIAlertController(title: "Weight Alert", message:
                "Please enter weight between 25-250 !", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            ageText.text=""
            
        }
        else {
            
            let bodyindex:Int = weight!/((height!/100)*(height!/100))
            
            if heat == "<20"{
                
                print(bodyindex)
                
            }else if heat == "20-30" {
                
                
            }else if heat == "30-40" {
                
                
                
            }else if heat == "40<"{
                
                
                
                
            }
        
        }
        
        
        
     
        
        //if(heatText.selectedSegmentIndex =="<20")
        
        
        self.performSegueWithIdentifier("toMainPage", sender: self)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func bodyIndexFunc(sender: AnyObject) {
        
        
        
    }
    

}*/

//
//  StartPageVC.swift
//  DietManager
//
//  Created by firat sezel on 24/12/15.
//  Copyright © 2015 firat sezel. All rights reserved.
//

import UIKit

class StartPageVC: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var heatText: UISegmentedControl!
    
    var waterL :Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //defaults.removeObjectForKey("water")
        if defaults.objectForKey("water") != nil {
            self.performSegueWithIdentifier("toMainPage", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendAction(sender: UIButton) {
        let heat:String = heatText.titleForSegmentAtIndex(heatText.selectedSegmentIndex)!
        
        let age = Double(ageText.text!)
        let height = Double(heightText.text!)
        let weight=Double(weightText.text!)
        
        if age<10 || age>110 {
            
            let alertController = UIAlertController(title: "Age Alert", message:
                "Please enter age between 10-100 !", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            ageText.text=""
            
        }else if height<100 || age>280 {
            
            let alertController = UIAlertController(title: "Height Alert", message:
                "Please enter height between 100-280 !", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            ageText.text=""
            
        }else if weight<25 || weight>250 {
            
            let alertController = UIAlertController(title: "Weight Alert", message:
                "Please enter weight between 25-250 !", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            ageText.text=""
            
        }
        else {
            
            let bodyindex:Double = weight!/((height!/100)*(height!/100))
            
            if heat == "<20"{
                if bodyindex < 18.5 {
                    waterL = ((weight! * 32 ))-600
                }
                else if bodyindex > 18.5 && bodyindex < 25{
                    waterL = ((weight! * 32 ) )-400
                }
                    
                else if bodyindex > 25{
                    waterL = ((weight! * 32 ))
                }
                
                
            }else if heat == "20-30" {
                if bodyindex < 18.5 {
                    waterL = ((weight! * 32 ))
                }
                else if bodyindex > 18.5 && bodyindex < 25{
                    waterL = ((weight! * 32 ) )+250
                }
                    
                else if bodyindex > 25{
                    waterL = ((weight! * 32 ) )+400
                }
                
                
                
            }else if heat == "30-40" {
                
                if bodyindex < 18.5 {
                    waterL = ((weight! * 32 ))+300
                }
                else if bodyindex > 18.5 && bodyindex < 25{
                    
                    waterL = ((weight! * 32 ))+500
                    
                    
                }
                    
                else if bodyindex > 25{
                    
                    waterL = ((weight! * 32 ) )+750
                    
                    
                }
                
                
                
                
            }else if heat == "40<"{
                
                if bodyindex < 18.5 {
                    
                    waterL = ((weight! * 32 ) )+400
                    
                }
                else if bodyindex > 18.5 && bodyindex < 25{
                    
                    waterL = ((weight! * 32 ) )+600
                    
                    
                }
                    
                else if bodyindex > 25{
                    
                    waterL = ((weight! * 32 ) )+1000
                    
                    
                }
                
                
            }
            
            print(waterL)
            
            
        }
        
        
        defaults.setObject(waterL, forKey: "water")
        
        
        //if(heatText.selectedSegmentIndex =="<20")
        
        
        self.performSegueWithIdentifier("toMainPage", sender: self)
        
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func bodyIndexFunc(sender: AnyObject) {
        
        
        
    }
    
    
}
