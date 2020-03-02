//
//  SplashScreenViewController.swift
//  iOS_ShoppingApp_Exercise
//
//  Created by Brendan Castro on 9/9/16.
//
//  dress icon:
//  Icons made by "http://www.freepik.com" licensed by "http://creativecommons.org/licenses/by/3.0/"

import UIKit
import LocalAuthentication

class SplashScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //background image provided by subtlepatterns.com
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pixel_weave")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func LoginButtonPressed(_ sender: UIButton) {
        let authContext = LAContext()
        var error: NSError?
        
        //check for touchID availability
        guard authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
            
            else {
            //touch id not available on this device
                //MainProductPageNavID
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainProductPageNavID") as! UINavigationController
                nextViewController.modalPresentationStyle = .overFullScreen
                self.present(nextViewController, animated:true, completion:nil)
            return
        }

        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        {
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "Ultra secure shopping app", reply: {(success: Bool, error: NSError!) -> Void in
                    if success {
                        //fingerprint accepted
                        print("fingerprint success")
                        //go to next page
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        
                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainProductPageNavID") as! UINavigationController
                        self.present(nextViewController, animated:true, completion:nil)
                    }
                    else {
                        //fingerprint rejected
                        if (error) != nil {
                            //if any kind of error, just skip to main screen
                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                            
                            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainProductPageNavID") as! UINavigationController
                            self.present(nextViewController, animated:true, completion:nil)
                        }
                        showSimpleAlertWithTitle("Touch ID Failure", message: "Fingerprint authentication failed. Please try again", viewController: self)
                    }
            } as! (Bool, Error?) -> Void)
        }
    }

}
