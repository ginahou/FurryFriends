//
//  LogInViewController.swift
//  FurryFriends
//
//  Created by Gina Hou on 2/16/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginButton.enabled = false
        loadingView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func emailDidChange(sender: AnyObject) {
        if (emailTextField.text.isEmpty || passwordTextField.text.isEmpty) {
            loginButton.enabled = false
        }
        else {
            loginButton.enabled = true}
    }

    @IBAction func didPressLoginButton(sender: AnyObject) {
        loadingView.hidden = false
        loadingView.startAnimating()
        loginButton.selected = true
        
        
        delay(2, { () -> () in
            
            if (self.passwordTextField.text == "pw") {
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                self.loginButton.enabled = true
                self.loadingView.stopAnimating()
            }
            else {
                var alertView = UIAlertView(title: "Alert", message: "Username an/or Password is incorrect", delegate: nil, cancelButtonTitle: "OK")
                alertView.show()
                self.passwordTextField.text = ""
                self.loginButton.selected = false
                self.loginButton.enabled = false
                self.loadingView.stopAnimating()
                self.loadingView.hidden = true
            }
            
            }
        )

    }
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
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
