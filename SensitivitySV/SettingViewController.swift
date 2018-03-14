//
//  SettingViewController.swift
//  NiconLensWear
//
//  Created by 森邦彦 on 2017/11/30.
//  Copyright © 2017年 Nicon-Essilor. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBAction func tappedEnglishButton(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateInitialViewController()
        present(nextView!, animated: true, completion: nil)
    }
    
    
    @IBAction func tappedJapaneseButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "MainJP", bundle: nil)
        let nextView = storyboard.instantiateInitialViewController()
        present(nextView!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "StartUp")
        nextVC?.modalTransitionStyle = .flipHorizontal
        present(nextVC!, animated: true, completion: nil)
*/
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
