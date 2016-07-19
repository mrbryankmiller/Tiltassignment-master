//
//  TiltViewController.swift
//  Tiltassignment
//
//  Created by Bryan  Miller on 7/17/16.
//  Copyright © 2016 IronYard. All rights reserved.
//

import UIKit
import CoreMotion

class TiltViewController: UIViewController  {
    
    
    var manager : CMMotionManager!
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.manager = CMMotionManager()
        if self.manager.deviceMotionAvailable {
            self.manager.deviceMotionUpdateInterval = 0.1
            
            self.manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue() ,withHandler: { (data:CMDeviceMotion?, error :NSError?) in
                
                if data != nil{
                    
                    
                    let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
                        type: .TiltAlongVerticalAxis)
                    verticalMotionEffect.minimumRelativeValue = -20
                    verticalMotionEffect.maximumRelativeValue = 20
                    
                    // Set horizontal effect
                    let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
                        type: .TiltAlongHorizontalAxis)
                    horizontalMotionEffect.minimumRelativeValue = 0
                    horizontalMotionEffect.maximumRelativeValue = 0
                    
                    // Create group to combine both
                    let group = UIMotionEffectGroup()
                    group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
                    
                    // Add both effects to your view
                    self.textView.addMotionEffect(group)
                    
                    
    
                    
                }
                
                
            })
            
            
            
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

    
    
    