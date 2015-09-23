//
//  BunnyViewController.swift
//  codepath-week2-lecture
//
//  Created by mmuno on 9/22/15.
//  Copyright © 2015 mmuno. All rights reserved.
//

import UIKit

class BunnyViewController: UIViewController, UIActionSheetDelegate {


    @IBOutlet weak var bunnyImageView: UIImageView!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var thinking: UIActivityIndicatorView!
    
    let spaceUnit =  CGFloat(20)
    var scale = CGFloat(1.0)
    var rotation = CGFloat(0)
    var initialCenter = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialCenter = bunnyImageView.center

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressRight(sender: AnyObject) {
        moveBunny(CGPoint(x: bunnyImageView.center.x + spaceUnit, y: bunnyImageView.center.y))
    }

    @IBAction func didPressLeft(sender: AnyObject) {
        moveBunny(CGPoint(x: bunnyImageView.center.x - spaceUnit, y: bunnyImageView.center.y))
    }
    
    @IBAction func didPressUp(sender: AnyObject) {
        moveBunny(CGPoint(x: bunnyImageView.center.x, y: bunnyImageView.center.y - spaceUnit))
    }
    
    @IBAction func didPressDown(sender: AnyObject) {
        moveBunny(CGPoint(x: bunnyImageView.center.x, y: bunnyImageView.center.y + spaceUnit))
    }
    
    @IBAction func didPressShrink(sender: AnyObject) {
        scale = scale - 0.2
        transformBunny()
    }
    
    @IBAction func didPressGrow(sender: AnyObject) {
        scale = scale + 0.2
        transformBunny()
    }
    
    @IBAction func didPressRotateLeft(sender: AnyObject) {
        rotation = rotation - CGFloat(20 * M_PI / 100)
        transformBunny()
    }
    
    @IBAction func didPressRotateRight(sender: AnyObject) {
        rotation = rotation + CGFloat(20 * M_PI / 100)
        transformBunny()
    }
    
    
    func transformBunny() {
        let rotationTransform = CGAffineTransformMakeRotation(rotation)
        let scaleTransform = CGAffineTransformMakeScale(scale, scale)
        let transform = CGAffineTransformConcat(scaleTransform, rotationTransform)
        
        UIView.animateWithDuration(0.3) {
            self.bunnyImageView.transform = transform
        }
    }
    
    func moveBunny(position: CGPoint) {
        UIView.animateWithDuration(0.3) {
            self.bunnyImageView.center = position
        }
    }

    @IBAction func didPressReset(sender: AnyObject) {
        UIView.animateWithDuration(0.6) {
            self.bunnyImageView.center = self.initialCenter
            self.bunnyImageView.transform = CGAffineTransformIdentity
        }
    }
    
    @IBAction func didPressSend(sender: AnyObject) {
        if inputTextField.text == "Hello" {
            writeBunnyMessage("Hello to you too")
        } else if inputTextField.text == "What is your name" {
            writeBunnyMessage("Kingsley")
        } else {
            writeBunnyMessage("I don't understand")
        }
        
        inputTextField.text = ""
    }
    
    func writeBunnyMessage(message: String) {
        thinking.startAnimating()
        delay(2, closure: { () -> () in
            self.responseLabel.text = message
            self.thinking.stopAnimating()
        })
    }
    
    @IBAction func didPressLogout(sender: AnyObject) {
        let actionSheet = UIActionSheet(title: "Are you sure", delegate: self, cancelButtonTitle: "Nah", destructiveButtonTitle: "Go!")
        
        actionSheet.showInView(view)
        
    }
    
    func actionSheet(alertView: UIActionSheet!, clickedButtonAtIndex buttonIndex: Int) {
        
        if buttonIndex == 0 {
            dismissViewControllerAnimated(true, completion: nil)
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
