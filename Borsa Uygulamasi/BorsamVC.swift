//
//  BorsamVC.swift
//  Deneme
//
//  Created by Can KINCAL on 21/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import UIKit

class BorsamVC: UIViewController {

    @IBOutlet weak var UsernameTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if let username = UsernameTextField.text {
            if let password = passwordTextField.text {
                print(username)
                print(password)
                if loginDict.keys.contains(username) {
                    if loginDict[username] == password {
                        performSegue(withIdentifier: "BorsamDetailVC", sender: nil)
                    }
                }
                else {
                    let alertController = UIAlertController(title: "Borsam", message:
                        "Kullanici Adi veya Sifre Hatali", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
