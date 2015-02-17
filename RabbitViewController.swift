//
//  RabbitViewController.swift
//  FurryFriends
//
//  Created by Gina Hou on 2/10/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

import UIKit

class RabbitViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var bunnyView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldView: UIImageView!
 
    
    var scale: CGFloat! = 1
    var rotation: CGFloat! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //scrollView.contentSize = CGSize(width:320, height:1080)
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapField(sender: UITapGestureRecognizer) {
        var location = sender.locationInView(view)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.bunnyView.center = location
        })
        
    }
 
    
    @IBAction func didPressUpButton(sender: AnyObject) {
        UIView.animateWithDuration(1, animations: { () -> Void in self.bunnyView.center.y = self.bunnyView.center.y - 20
            })
        
    }

    @IBAction func didPressDownButton(sender: AnyObject) {
        UIView.animateWithDuration(1, animations: { () -> Void in self.bunnyView.center.y = self.bunnyView.center.y + 20
        })
    }
    
    @IBAction func didPressLeftButton(sender: AnyObject) {
        UIView.animateWithDuration(1, animations: { () -> Void in self.bunnyView.center.x = self.bunnyView.center.x - 20
        })
    }
    
    @IBAction func didPressRightButton(sender: AnyObject) {
        UIView.animateWithDuration(1, animations: { () -> Void in self.bunnyView.center.x = self.bunnyView.center.x + 20
        })
    }
    
    @IBAction func didPressHideButton(sender: AnyObject) {
        //bunnyView.hidden = true
        UIView.animateWithDuration(0.5, animations: { () -> Void in self.bunnyView.alpha = 0
            self.bunnyView.transform = CGAffineTransformMakeScale(0.1, 0.1)
        })
    }
    
    @IBAction func didPressShowButton(sender: AnyObject) {
        //bunnyView.hidden = false
        UIView.animateWithDuration(0.5, animations: { () -> Void in self.bunnyView.alpha = 1
            self.bunnyView.transform = CGAffineTransformMakeScale(1, 1)
        })
    }
    

    @IBAction func didPressLeafButton(sender: AnyObject) {
        if scale < 5 {
            scale = scale + 0.2
        }
        
        var scaleTransform = CGAffineTransformMakeScale(scale, scale)
        var rotationTransform = CGAffineTransformMakeDegreeRotation(rotation)
        var transform = CGAffineTransformConcat(scaleTransform, rotationTransform)
        UIView.animateWithDuration(0.5, animations: { () -> Void in self.bunnyView.transform = transform//CGAffineTransformMakeScale(scale, scale)
        })
    }
        
    @IBAction func didPressTearButton(sender: AnyObject) {
        scale = scale - 0.2
        
        var scaleTransform = CGAffineTransformMakeScale(scale, scale)
        var rotationTransform = CGAffineTransformMakeDegreeRotation(rotation)
        var transform = CGAffineTransformConcat(scaleTransform, rotationTransform)
        UIView.animateWithDuration(0.5, animations: { () -> Void in self.bunnyView.transform = transform
        })

    }
    
    @IBAction func onResetButton(sender: AnyObject) {
        scale = 1
        UIView.animateWithDuration(0.5, animations: { () -> Void in self.bunnyView.transform = CGAffineTransformMakeScale(self.scale, self.scale)
        })
    }
    
    
    @IBAction func didPressRotateLtButton(sender: AnyObject) {
        rotation = rotation - 10
        
        var scaleTransform = CGAffineTransformMakeScale(scale, scale)
        var rotationTransform = CGAffineTransformMakeDegreeRotation(rotation)
        var transform = CGAffineTransformConcat(scaleTransform, rotationTransform)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in self.bunnyView.transform = transform//CGAffineTransformMakeDegreeRotation(rotation)
        
//        var rotation = 10 * CGFloat(M_PI / 100)
//        
//        self.bunnyView.transform = CGAffineTransformMakeRotation(rotation)
        })
    }
    
    @IBAction func didPressRotateRtButton(sender: AnyObject) {
        rotation = rotation + 10
        
        var scaleTransform = CGAffineTransformMakeScale(scale, scale)
        var rotationTransform = CGAffineTransformMakeDegreeRotation(rotation)
        var transform = CGAffineTransformConcat(scaleTransform, rotationTransform)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in self.bunnyView.transform = transform//CGAffineTransformMakeDegreeRotation(rotation)
        })
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var yOffset = scrollView.contentOffset.y
        
        fieldView.frame.origin.y = yOffset / 5
    }
    
    // use UIView.animate for animating things. duration and what you want to animate
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
