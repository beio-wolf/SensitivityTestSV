//
//  SettingsViewController.swift
//  NiconLensWear
//
//  Created by 森邦彦 on 2017/12/04.
//  Copyright © 2017年 Nicon-Essilor. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setNeedsStatusBarAppearanceUpdate()
    }

    @IBAction func tappedEnglishButton(_ sender: Any) {
        
        let dataServer = DataServer.shared
        dataServer.setRegion(Region.US)
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        let next: UIViewController = storyboard.instantiateInitialViewController() as UIViewController!
        present(next, animated: false, completion: nil)
    }
    
    @IBAction func tappedJapaneseButton(_ sender: Any) {

        let dataServer = DataServer.shared
        dataServer.setRegion(Region.JP)

        let storyboard: UIStoryboard = UIStoryboard(name: "MainJP",bundle: nil)
        let next: UIViewController = storyboard.instantiateInitialViewController() as UIViewController!
        present(next, animated: false, completion: nil)
    }
    
    @IBAction func tappedChinese1Button(_ sender: Any) {

        let dataServer = DataServer.shared
        dataServer.setRegion(Region.CH1)

        let storyboard: UIStoryboard = UIStoryboard(name: "MainCH1",bundle: nil)
        let next: UIViewController = storyboard.instantiateInitialViewController() as UIViewController!
        present(next, animated: false, completion: nil)
    }
    
    @IBAction func tappedChinese2Button(_ sender: Any) {

        let dataServer = DataServer.shared
        dataServer.setRegion(Region.CH2)
        
        let storyboard: UIStoryboard = UIStoryboard(name: "MainCH2",bundle: nil)
        let next: UIViewController = storyboard.instantiateInitialViewController() as UIViewController!
        present(next, animated: false, completion: nil)
    }
    
    @IBAction func tappedManualButton(_ sender: Any) {
     
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Web")
        nextVC?.modalTransitionStyle = .crossDissolve
        present(nextVC!, animated: false, completion: nil)
    }
    
    @IBAction func tappedBackButton(_ sender: Any) {
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectTest")
        nextVC?.modalTransitionStyle = .crossDissolve
        present(nextVC!, animated: false, completion: nil)
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
