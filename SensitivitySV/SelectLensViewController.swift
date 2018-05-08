//
//  SelectLensViewController.swift
//  SensitivitySV
//
//  Created by 森邦彦 on 2018/03/19.
//  Copyright © 2018年 Nicon-Essilor. All rights reserved.
//

import UIKit

class SelectLensViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setNeedsStatusBarAppearanceUpdate()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func tappedSingleVisionButton(_ sender: Any) {

        let dataServer = DataServer.shared
        dataServer.setLensType(LensType.SingleVision)
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier:"NewestPrescription")
        nextVC?.modalTransitionStyle = .crossDissolve
        present(nextVC!, animated: false, completion: nil)
    }
    
    @IBAction func tappedSingleVisionForReadingGlassesButton(_ sender: Any) {
        
        let dataServer = DataServer.shared
        dataServer.setLensType(LensType.SingleVisionForReadingGlasses)
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier:"NewestPrescription")
        nextVC?.modalTransitionStyle = .crossDissolve
        present(nextVC!, animated: false, completion: nil)
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
