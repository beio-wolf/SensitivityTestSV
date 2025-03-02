//
//  StartUpViewController.swift
//  NiconLensWear
//
//  Created by 森邦彦 on 2017/11/06.
//  Copyright © 2017年 Nicon-Essilor. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {

    @IBAction func tappedStartButton(_ sender: Any) {

        let dataServer: DataServer = DataServer.shared
        let region: Region = dataServer.getRegion()
        dataServer.setSettingPos(SettingPos.Module)
        
        if (region == Region.US) {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextView = storyboard.instantiateInitialViewController()
            present(nextView!, animated: true, completion: nil)
        } else if (region == Region.JP){
            let storyboard: UIStoryboard = UIStoryboard(name: "MainJP", bundle: nil)
            let nextView = storyboard.instantiateInitialViewController()
            present(nextView!, animated: true, completion: nil)
        } else if (region == Region.CH1){
            let storyboard: UIStoryboard = UIStoryboard(name: "MainCH1", bundle: nil)
            let nextView = storyboard.instantiateInitialViewController()
            present(nextView!, animated: true, completion: nil)
        } else if (region == Region.CH2){
            let storyboard: UIStoryboard = UIStoryboard(name: "MainCH2", bundle: nil)
            let nextView = storyboard.instantiateInitialViewController()
            present(nextView!, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
