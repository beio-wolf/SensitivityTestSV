//
//  ResultViewController.swift
//  NiconLensWear
//
//  Created by 森邦彦 on 2017/11/23.
//  Copyright © 2017年 Nicon-Essilor. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultValue_: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
/*
        // Do any additional setup after loading the view.
        let dataServer  = DataServer.shared
        if (dataServer.getResultValue() > 0) {
            resultValue_.text = "+" + dataServer.getResultValue().description
        } else if (dataServer.getResultValue() < 0) {
            resultValue_.text = dataServer.getResultValue().description
        } else {
            resultValue_.text = "0"
        }
        
//        let dataServer  = DataServer.shared
//        let resultValue:Int = dataServer.getResultValue()
        
//        resultValue_.text = dataServer.getResultValue().description
         */
        
        resultValue_.textColor = UIColor(red:0.231372549,
                                         green:0.250980392,
                                         blue:0.294117647,
                                         alpha:1.0)
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Do any additional setup after loading the view.
        let dataServer  = DataServer.shared
        if (dataServer.getResultValue() > 0) {
            resultValue_.text = "+" + dataServer.getResultValue().description
        } else if (dataServer.getResultValue() < 0) {
            resultValue_.text = dataServer.getResultValue().description
        } else {
            resultValue_.text = "0"
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning()
    {
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
