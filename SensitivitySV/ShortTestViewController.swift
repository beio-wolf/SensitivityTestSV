//
//  ShortTestViewController.swift
//  NiconLensWear
//
//  Created by 森邦彦 on 2017/11/14.
//  Copyright © 2017年 Nicon-Essilor. All rights reserved.
//

import UIKit

class ShortTestViewController: UIViewController {

    var imageName: String = "Inf7_ST1_minus"
    var currentIndex: Int = 0
    
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var pager: UIPageControl!
    @IBOutlet weak var indexLabel_: UILabel!

    @IBAction func tappedStartUpButton(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectTest")
        nextVC?.modalTransitionStyle = .crossDissolve
        present(nextVC!, animated: true, completion: nil)
    }
    
    @IBAction func tappedLeftFullButton(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Test")
        nextVC?.modalTransitionStyle = .crossDissolve
        present(nextVC!, animated: true, completion: nil)
    }
    
    @IBAction func tappedLeftButton(_ sender: Any) {
        if (currentIndex > 3) {
            currentIndex -= 1
            pager.currentPage = currentIndex - 3
        }
        
        let displayName: String = imageName + String(currentIndex + 1) + ".png"
        let image:UIImage = UIImage(named: displayName)!
        showImage.image = image
        
        let number:Int = currentIndex - 2
        indexLabel_.text = number.description
    }
    
    @IBAction func tappedRightFullButton(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Test")
        nextVC?.modalTransitionStyle = .crossDissolve
        present(nextVC!, animated: true, completion: nil)
    }
    
    
    @IBAction func tappedRightButton(_ sender: Any) {
        if (currentIndex < 8) {
            currentIndex += 1
            pager.currentPage = currentIndex - 3
        }
        
        let displayName: String = imageName + String(currentIndex + 1) + ".png"
        let image:UIImage = UIImage(named: displayName)!
        showImage.image = image

        let number:Int = currentIndex - 2
        indexLabel_.text = number.description
    }
    
    @IBAction func tappedConfirmButton(_ sender: Any) {
        if (currentIndex == 3 || currentIndex == 8) {

            let dataServer = DataServer.shared
            dataServer.setConfirmIndex(currentIndex)

            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "FullTest")
            nextVC?.modalTransitionStyle = .crossDissolve
            present(nextVC!, animated: true, completion: nil)
        } else {
            let dataServer = DataServer.shared
            dataServer.setConfirmIndex(currentIndex)
            
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Great")
            nextVC?.modalTransitionStyle = .crossDissolve
            present(nextVC!, animated: true, completion: nil)
        }
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
        
        currentIndex = 3
        let displayName: String = imageName + String(currentIndex + 1) + ".png"
        let image:UIImage = UIImage(named: displayName)!
        showImage.image = image
        
        let number:Int = currentIndex - 2
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
