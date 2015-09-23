//
//  LoginViewController.swift
//  codepath-week2-lecture
//
//  Created by mmuno on 9/22/15.
//  Copyright © 2015 mmuno. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {
        if usernameField.text == "hi" && passwordField.text == "ho" {
            performSegueWithIdentifier("goToBunny", sender: nil)
        } else {
            let alert = UIAlertView(title: "Error", message: "Wrong credentials", delegate: nil, cancelButtonTitle: "ok, bye")
            alert.show()
        }
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
