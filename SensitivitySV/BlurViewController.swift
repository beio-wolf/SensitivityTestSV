//
//  BlurViewController.swift
//  NiconLensWear
//
//  Created by 森邦彦 on 2017/11/14.
//  Copyright © 2017年 Nicon-Essilor. All rights reserved.
//

import UIKit

class BlurViewController: UIViewController {

    @IBOutlet weak var glassButton: UIButton!
    @IBOutlet weak var normalGlassButton: UIButton!

    @IBAction func tappedStartUpButton(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectTest")
        nextVC?.modalTransitionStyle = .flipHorizontal
        present(nextVC!, animated: true, completion: nil)
    }
    
    @IBAction func tappedNormalGlassButton(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "StartUp")
        nextVC?.modalTransitionStyle = .flipHorizontal
        present(nextVC!, animated: true, completion: nil)
    }
    
    @IBAction func tappedGlassButton(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "StartUp")
        nextVC?.modalTransitionStyle = .flipHorizontal
        present(nextVC!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let dataServer = DataServer.shared
        let glassType = dataServer.getGlassType()
        
        if (glassType == GlassType.TrialSet) {
            glassButton.isHidden = false
            normalGlassButton.isHidden = true
        } else {
            glassButton.isHidden = true
            normalGlassButton.isHidden = false
        }
        
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
