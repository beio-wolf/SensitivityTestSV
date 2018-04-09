//
//  LoadingViewController.swift
//  NiconLensWear
//
//  Created by 森邦彦 on 2017/12/03.
//  Copyright © 2017年 Nicon-Essilor. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    weak var timer_: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setNeedsStatusBarAppearanceUpdate()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        timer_ = Timer.scheduledTimer(
            timeInterval: 2.00,
            target: self,
            selector: #selector(self.timerFired),
            userInfo: nil,
            repeats: false)
    }
    
    @objc func timerFired() {
        
        // ログインが必要かチェック
        if (UserDefaults.standard.object(forKey: "auth") != nil) {
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Title")
            nextVC?.modalTransitionStyle = .crossDissolve
            present(nextVC!, animated: true, completion: nil)
        } else {
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Login")
            nextVC?.modalTransitionStyle = .crossDissolve
            present(nextVC!, animated: true, completion: nil)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
