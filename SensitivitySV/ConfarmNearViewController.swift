//
//  ConfarmNearViewController.swift
//  SensitivitySV
//
//  Created by 森邦彦 on 2018/04/11.
//  Copyright © 2018年 Nicon-Essilor. All rights reserved.
//

import UIKit

class ConfarmNearViewController: UIViewController {

    @IBOutlet weak var distanceLabel_: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 距離を算出
        let dataServer = DataServer.shared
        
        let S_old_R:Float = dataServer.getCurrentPrescriptionR_S()
        let C_old_R:Float = dataServer.getCurrentPrescriptionR_C()
        let S_old_L:Float = dataServer.getCurrentPrescriptionL_S()
        let C_old_L:Float = dataServer.getCurrentPrescriptionL_C()
        
        let S_new_R:Float = dataServer.getNewestPrescriptionR_S()
        let C_new_R:Float = dataServer.getNewestPrescriptionR_C()
        let S_new_L:Float = dataServer.getNewestPrescriptionL_S()
        let C_new_L:Float = dataServer.getNewestPrescriptionL_C()
        
        let S_old:Float = (S_old_R + S_old_L) / 2.0
        let S_new:Float = (S_new_R + S_new_L) / 2.0
        let C_old:Float = (C_old_R + C_old_L) / 2.0
        let C_new:Float = (C_new_R + C_new_L) / 2.0
        
        let N_old:Float = S_old + (C_old / 2.0)
        let N_new:Float = S_new + (C_new / 2.0)
        
        let G_n:Float = N_new - N_old
        
        var distance:Float = 100.0 / (2.5 + G_n)
        if (distance >= 50.0) {
            distance = 50.0
        } else if (distance <= 30.0) {
            distance = 30.0
        }
        
        // 距離を表示
        distanceLabel_.text = String(distance) + "m"
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
