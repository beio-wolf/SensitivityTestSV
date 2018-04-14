//
//  LoginViewController.swift
//  NiconLensWear
//
//  Created by 森邦彦 on 2017/11/23.
//  Copyright © 2017年 Nicon-Essilor. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var loginFaildImage_: UIImageView!
    
    @IBAction func tappedEnterButton(_ sender: Any) {
        let inputString:String? = myTextField.text
        if (inputString == "NikonLenswear100") {
            UserDefaults.standard.set(true, forKey: "auth")
            loginFaildImage_.isHidden = true
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Settings")
            nextVC?.modalTransitionStyle = .crossDissolve
            present(nextVC!, animated: true, completion: nil)
        } else {
            loginFaildImage_.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myTextField.delegate = self
        loginFaildImage_.isHidden = true
        
        self.setNeedsStatusBarAppearanceUpdate()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     UITextFieldが編集終了する直前に呼ばれるデリゲートメソッド.
     */
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + myTextField.text!)
        
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
