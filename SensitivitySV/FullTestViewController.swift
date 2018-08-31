//
//  TestViewController.swift
//  NiconLensWear
//
//  Created by 森邦彦 on 2017/11/13.
//  Copyright © 2017年 Nicon-Essilor. All rights reserved.
//

import UIKit

class FullTestViewController: UIViewController {

    var imageName: String = "Inf7_ST1_minus"
    var currentIndex: Int = 0
    
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var pager: UIPageControl!
    @IBOutlet weak var imageIndex_: UILabel!
    
    @IBAction func tappedLeftButton(_ sender: Any) {
        if (currentIndex > 0) {
            currentIndex -= 1
            pager.currentPage = currentIndex
        }
        
        let displayName: String = imageName + String(currentIndex + 1) + ".png"
        let image:UIImage = UIImage(named: displayName)!
        showImage.image = image
        
        let number:Int = currentIndex + 1
        imageIndex_.text = number.description
    }
    
    @IBAction func tappedRightButton(_ sender: Any) {
        if (currentIndex < 11) {
            currentIndex += 1
            pager.currentPage = currentIndex
        }
        
        let displayName: String = imageName + String(currentIndex + 1) + ".png"
        let image:UIImage = UIImage(named: displayName)!
        showImage.image = image

        let number:Int = currentIndex + 1
        imageIndex_.text = number.description
    }

    @IBAction func tappedStartUpButton(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectTest")
        nextVC?.modalTransitionStyle = .crossDissolve
        present(nextVC!, animated: true, completion: nil)
    }
    
    @IBAction func tappedConfirmButton(_ sender: Any) {
        let dataServer = DataServer.shared
        dataServer.setConfirmIndex(currentIndex)
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Great")
        nextVC?.modalTransitionStyle = .crossDissolve
        present(nextVC!, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let dataServer = DataServer.shared
        let eyeStatus:EyeStatus = dataServer.getEyeStatus()
        
        if (eyeStatus == EyeStatus.Myope) {
            imageName = "Inf7_ST1_minus"
        } else {
            imageName = "Inf7_ST1_plus"
        }
        
        currentIndex = dataServer.getConfirmIndex()
        if (currentIndex < 4) {
            currentIndex = 0
            pager.currentPage = 0

        } else if (currentIndex > 6) {
            currentIndex = 11
            pager.currentPage = 11
        }
        
        let productTypeName:String
        let deviceName:String = dataServer.getDeviceInfo()
        if (deviceName.contains("iPad Pro 9.7inch")) {
            productTypeName = "_S_"
        }
        else if (deviceName.contains("iPad Pro 10.5inch")) {
            productTypeName = "_M_"
        }
        else if (deviceName.contains("iPad Pro 12.9inch")) {
            productTypeName = "_L_"
        } else {
            productTypeName = ""
        }
        
        let displayName: String = imageName + productTypeName + String(currentIndex + 1) + ".png"
        let image:UIImage = UIImage(named: displayName)!
        showImage.image = image
        
        let number:Int = currentIndex + 1
        imageIndex_.text = number.description
        
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
