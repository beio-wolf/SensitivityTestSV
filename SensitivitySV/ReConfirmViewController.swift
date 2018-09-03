//
//  ReConfirmViewController.swift
//  NiconLensWear
//
//  Created by 森邦彦 on 2017/11/23.
//  Copyright © 2017年 Nicon-Essilor. All rights reserved.
//

import UIKit

class ReConfirmViewController: UIViewController {

    var imageName: String = "Inf7_ST1_minus"
    var currentIndex: Int = 0
    
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var pager: UIPageControl!
    @IBOutlet weak var indexLabel_: UILabel!
    
    @IBAction func tappedLeftButton(_ sender: Any) {
        
        let dataServer = DataServer.shared
        var confirmIndex:Int = dataServer.getConfirmIndex()

        /*
        if (currentIndex == 0) {
            if (currentIndex > confirmIndex - 1) {
                if (currentIndex > 0) {
                    currentIndex -= 1
                }
            }
        } else if (currentIndex > 1 && currentIndex < 11) {
            if (currentIndex > confirmIndex - 1) {
                currentIndex -= 2
            }
        } else if (currentIndex == 11) {
            if (currentIndex > confirmIndex - 1) {
                currentIndex -= 1
            }
        }
         */

        if (confirmIndex == 0) {
            confirmIndex = 1
            currentIndex = 0
        } else if (currentIndex > confirmIndex) {
            currentIndex -= 2
        } else if (confirmIndex == 11) {
            confirmIndex = 11
            currentIndex = 10
        }
        
        if (confirmIndex < 0) {
            confirmIndex = 0
        }
        if (confirmIndex > 11) {
            confirmIndex = 11
        }
        if (currentIndex < 0) {
            currentIndex = 0
        }
        if (currentIndex > 11) {
            currentIndex = 11
        }
        
        pager.currentPage = 0
        
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
        
        let number:Int = 1
        indexLabel_.text = number.description
    }    
    
    @IBAction func tappedRightButton(_ sender: Any) {

        let dataServer = DataServer.shared
        var confirmIndex:Int = dataServer.getConfirmIndex()

        /*
        currentIndex = dataServer.getConfirmIndex()
        if (currentIndex == 0) {
            if (currentIndex > confirmIndex - 1) {
                currentIndex += 1
            }
        } else if (currentIndex > 1 && currentIndex < 11) {
            if (currentIndex > confirmIndex - 1) {
                currentIndex += 2
            }
        } else if (currentIndex == 11) {
            if (currentIndex > confirmIndex - 1) {
                currentIndex += 1
            }
        }
         */

        if (confirmIndex == 0) {
            confirmIndex = 0
            currentIndex = 1
        } else if (currentIndex < confirmIndex) {
            currentIndex += 2
        } else if (confirmIndex == 11) {
            confirmIndex = 10
            currentIndex = 11
        }
        
        if (confirmIndex < 0) {
            confirmIndex = 0
        }
        if (confirmIndex > 11) {
            confirmIndex = 11
        }
        if (currentIndex < 0) {
            currentIndex = 0
        }
        if (currentIndex > 11) {
            currentIndex = 11
        }

        pager.currentPage = 1
        
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
        
        let number:Int = 2
        indexLabel_.text = number.description
    }
    
    @IBAction func tappedReConfirmButton(_ sender: Any) {
        
        let dataServer = DataServer.shared
        dataServer.setReConfirmIndex(currentIndex)

        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Result")
        nextVC?.modalTransitionStyle = .crossDissolve
        present(nextVC!, animated: true, completion: nil)
    }
    
    @IBAction func tappedStartUpButton(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectTest")
        nextVC?.modalTransitionStyle = .crossDissolve
        present(nextVC!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let dataServer = DataServer.shared
        let confirmIndex:Int = dataServer.getConfirmIndex()
        let eyeStatus:EyeStatus = dataServer.getEyeStatus()
        
        if (eyeStatus == EyeStatus.Myope) {
            imageName = "Inf7_ST1_minus"
        } else {
            imageName = "Inf7_ST1_plus"
        }
        
        currentIndex = confirmIndex
        currentIndex -= 1
        if (currentIndex < 0) {
            currentIndex = 0
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
        
        let number:Int = 1
        indexLabel_.text = number.description

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
