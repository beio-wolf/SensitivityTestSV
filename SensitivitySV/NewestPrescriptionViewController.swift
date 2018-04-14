//
//  NewestPrescriptionViewController.swift
//  SensitivitySV
//
//  Created by 森邦彦 on 2018/03/21.
//  Copyright © 2018年 Nicon-Essilor. All rights reserved.
//

import UIKit

let prescriptionPickerView0 = UIPickerView()
let prescriptionPickerView1 = UIPickerView()
let prescriptionPickerView2 = UIPickerView()
let prescriptionPickerView3 = UIPickerView()

var intDataArray = ["+10", "+9", "+8", "+7", "+6", "+5", "+4", "+3", "+2", "+1", "+0",
                    "-0", "-1", "-2", "-3", "-4", "-5", "-6", "-7", "-8", "-9", "-10",
                    "-11", "-12", "-13", "-14", "-15", "-16"]
var decimalDataArray = ["00", "25", "50", "75"]

class NewestPrescriptionViewController: UIViewController,
                                        UIPickerViewDataSource,
                                        UIPickerViewDelegate{

    @IBOutlet weak var prescriptionTextField0_: UITextField!
    @IBOutlet weak var prescriptionTextField1_: UITextField!
    @IBOutlet weak var prescriptionTextField2_: UITextField!
    @IBOutlet weak var prescriptionTextField3_: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let dataServer = DataServer.shared
        let region = dataServer.getRegion()
 
        let fontColor:UIColor = UIColor(red:0.231372549,
                                        green:0.250980392,
                                        blue:0.294117647,
                                        alpha:1.0)
        
        // 初期値を設定
        dataServer.setNewestPrescriptionR_S(0.0)
        dataServer.setNewestPrescriptionR_C(0.0)
        dataServer.setNewestPrescriptionL_S(0.0)
        dataServer.setNewestPrescriptionL_C(0.0)

        if (region == Region.US) {
            do {
                prescriptionPickerView0.frame = CGRect(x:0, y:0,
                                                width:UIScreen.main.bounds.size.width,
                                                height:prescriptionPickerView0.bounds.size.height)
                prescriptionPickerView0.delegate   = self
                prescriptionPickerView0.dataSource = self
                prescriptionPickerView0.selectRow(10, inComponent: 0, animated: false)
                prescriptionPickerView0.selectRow(0, inComponent: 1, animated: false)
                prescriptionPickerView0.selectRow(0, inComponent: 2, animated: false)

                let view0 = UIView(frame: prescriptionPickerView0.bounds)
                view0.backgroundColor = UIColor.white
                view0.addSubview(prescriptionPickerView0)
                
                prescriptionTextField0_.inputView = view0
                
                let toolBar0 = UIToolbar()
                toolBar0.barStyle = UIBarStyle.default
                toolBar0.isTranslucent = true
                toolBar0.tintColor = UIColor.black
                let doneButton0   = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.donePressed0))
                doneButton0.tintColor = fontColor
                let cancelButton0 = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed0))
                cancelButton0.tintColor = fontColor
                let spaceButton0  = UIBarButtonItem(barButtonSystemItem:    UIBarButtonSystemItem.flexibleSpace,
                                                    target: nil,
                                                    action: nil)
                toolBar0.setItems([spaceButton0, cancelButton0, spaceButton0, doneButton0, spaceButton0], animated: false)
                toolBar0.isUserInteractionEnabled = true
                toolBar0.sizeToFit()
                prescriptionTextField0_.inputAccessoryView = toolBar0
                prescriptionTextField0_.text = "0.00"
            }
            
            do {
                prescriptionPickerView1.frame = CGRect(x:0, y:0,
                                                      width:UIScreen.main.bounds.size.width,
                                                      height:prescriptionPickerView1.bounds.size.height)
                prescriptionPickerView1.delegate   = self
                prescriptionPickerView1.dataSource = self
                prescriptionPickerView1.selectRow(10, inComponent: 0, animated: false)
                prescriptionPickerView1.selectRow(0, inComponent: 1, animated: false)
                prescriptionPickerView1.selectRow(0, inComponent: 2, animated: false)

                let view1 = UIView(frame: prescriptionPickerView1.bounds)
                view1.backgroundColor = UIColor.white
                view1.addSubview(prescriptionPickerView1)
                
                prescriptionTextField1_.inputView = view1
                
                let toolBar1 = UIToolbar()
                toolBar1.barStyle = UIBarStyle.default
                toolBar1.isTranslucent = true
                toolBar1.tintColor = UIColor.black
                let doneButton1   = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.donePressed1))
                doneButton1.tintColor = fontColor
                let cancelButton1 = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed1))
                cancelButton1.tintColor = fontColor
                let spaceButton1  = UIBarButtonItem(barButtonSystemItem:    UIBarButtonSystemItem.flexibleSpace,
                                                    target: nil,
                                                    action: nil)
                toolBar1.setItems([spaceButton1, cancelButton1, spaceButton1, doneButton1, spaceButton1], animated: false)
                toolBar1.isUserInteractionEnabled = true
                toolBar1.sizeToFit()
                prescriptionTextField1_.inputAccessoryView = toolBar1
                prescriptionTextField1_.text = "0.00"
            }
            
            do {
                prescriptionPickerView2.frame = CGRect(x:0, y:0,
                                                       width:UIScreen.main.bounds.size.width,
                                                       height:prescriptionPickerView2.bounds.size.height)
                prescriptionPickerView2.delegate   = self
                prescriptionPickerView2.dataSource = self
                prescriptionPickerView2.selectRow(10, inComponent: 0, animated: false)
                prescriptionPickerView2.selectRow(0, inComponent: 1, animated: false)
                prescriptionPickerView2.selectRow(0, inComponent: 2, animated: false)

                let view2 = UIView(frame: prescriptionPickerView2.bounds)
                view2.backgroundColor = UIColor.white
                view2.addSubview(prescriptionPickerView2)
                
                prescriptionTextField2_.inputView = view2
                
                let toolBar2 = UIToolbar()
                toolBar2.barStyle = UIBarStyle.default
                toolBar2.isTranslucent = true
                toolBar2.tintColor = UIColor.black
                let doneButton2   = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.donePressed2))
                doneButton2.tintColor = fontColor
                let cancelButton2 = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed2))
                cancelButton2.tintColor = fontColor
                let spaceButton2  = UIBarButtonItem(barButtonSystemItem:    UIBarButtonSystemItem.flexibleSpace,
                                                    target: nil,
                                                    action: nil)
                toolBar2.setItems([spaceButton2, cancelButton2, spaceButton2, doneButton2, spaceButton2], animated: false)
                toolBar2.isUserInteractionEnabled = true
                toolBar2.sizeToFit()
                prescriptionTextField2_.inputAccessoryView = toolBar2
                prescriptionTextField2_.text = "0.00"
            }
            
            do {
                prescriptionPickerView3.frame = CGRect(x:0, y:0,
                                                       width:UIScreen.main.bounds.size.width,
                                                       height:prescriptionPickerView3.bounds.size.height)
                prescriptionPickerView3.delegate   = self
                prescriptionPickerView3.dataSource = self
                prescriptionPickerView3.selectRow(10, inComponent: 0, animated: false)
                prescriptionPickerView3.selectRow(0, inComponent: 1, animated: false)
                prescriptionPickerView3.selectRow(0, inComponent: 2, animated: false)

                let view3 = UIView(frame: prescriptionPickerView3.bounds)
                view3.backgroundColor = UIColor.white
                view3.addSubview(prescriptionPickerView3)
                
                prescriptionTextField3_.inputView = view3
                
                let toolBar3 = UIToolbar()
                toolBar3.barStyle = UIBarStyle.default
                toolBar3.isTranslucent = true
                toolBar3.tintColor = UIColor.black
                let doneButton3   = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.donePressed3))
                doneButton3.tintColor = fontColor
                let cancelButton3 = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed3))
                cancelButton3.tintColor = fontColor
                let spaceButton3  = UIBarButtonItem(barButtonSystemItem:    UIBarButtonSystemItem.flexibleSpace,
                                                    target: nil,
                                                    action: nil)
                toolBar3.setItems([spaceButton3, cancelButton3, spaceButton3, doneButton3, spaceButton3], animated: false)
                toolBar3.isUserInteractionEnabled = true
                toolBar3.sizeToFit()
                prescriptionTextField3_.inputAccessoryView = toolBar3
                prescriptionTextField3_.text = "0.00"
            }

        } else {
            print("Invalid region")
        }
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    // Done
    @objc func donePressed0() {
        
        let intIndex:Int = prescriptionPickerView0.selectedRow(inComponent: 0)
        let intName:String = intDataArray[intIndex]

        let decimalIndex:Int = prescriptionPickerView0.selectedRow(inComponent: 2)
        let decimalName:String = decimalDataArray[decimalIndex]

        prescriptionTextField0_.text = intName + "." + decimalName

        // 選択された値を保存
        let dataServer = DataServer.shared
        dataServer.setNewestPrescriptionR_S(Float(prescriptionTextField0_.text!)!)

        view.endEditing(true)
    }

    @objc func donePressed1() {
        
        let intIndex:Int = prescriptionPickerView1.selectedRow(inComponent: 0)
        let intName:String = intDataArray[intIndex]
        
        let decimalIndex:Int = prescriptionPickerView1.selectedRow(inComponent: 2)
        let decimalName:String = decimalDataArray[decimalIndex]
        
        prescriptionTextField1_.text = intName + "." + decimalName
        
        // 選択された値を保存
        let dataServer = DataServer.shared
        dataServer.setNewestPrescriptionR_C(Float(prescriptionTextField1_.text!)!)

        view.endEditing(true)
    }

    @objc func donePressed2() {
        
        let intIndex:Int = prescriptionPickerView2.selectedRow(inComponent: 0)
        let intName:String = intDataArray[intIndex]
        
        let decimalIndex:Int = prescriptionPickerView2.selectedRow(inComponent: 2)
        let decimalName:String = decimalDataArray[decimalIndex]
        
        prescriptionTextField2_.text = intName + "." + decimalName
        
        // 選択された値を保存
        let dataServer = DataServer.shared
        dataServer.setNewestPrescriptionL_S(Float(prescriptionTextField2_.text!)!)

        view.endEditing(true)
    }
    
    @objc func donePressed3() {
        
        let intIndex:Int = prescriptionPickerView3.selectedRow(inComponent: 0)
        let intName:String = intDataArray[intIndex]
        
        let decimalIndex:Int = prescriptionPickerView3.selectedRow(inComponent: 2)
        let decimalName:String = decimalDataArray[decimalIndex]
        
        prescriptionTextField3_.text = intName + "." + decimalName
        
        // 選択された値を保存
        let dataServer = DataServer.shared
        dataServer.setNewestPrescriptionL_C(Float(prescriptionTextField3_.text!)!)

        view.endEditing(true)
    }

    // Cancel
    @objc func cancelPressed0() {
        view.endEditing(true)
    }
    
    @objc func cancelPressed1() {
        view.endEditing(true)
    }

    @objc func cancelPressed2() {
        view.endEditing(true)
    }

    @objc func cancelPressed3() {
        view.endEditing(true)
    }

    ////// ドラムロールのプロトコル //////
    // コンポーネント数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // 列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // 行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return intDataArray.count
        }
        else if (component == 1) {
            return 1
        }
        else if (component == 2) {
            return decimalDataArray.count
        }
        
        return 0;
    }
    
    // 横幅
    /*
     func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
     if (component == 0) {
     return 100
     } else {
     return 200
     }
     }
     */
    
    // pickerに表示するUIViewを返す
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let fontColor:UIColor = UIColor(red:0.231372549,
                                        green:0.250980392,
                                        blue:0.294117647,
                                        alpha:1.0)
        // 表示するラベルを生成する
//        if (pickerView.tag == 1) {
        if (component == 0) {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
            label.textAlignment = .center
            label.text = intDataArray[row]
            label.font = UIFont.systemFont(ofSize:24.0)
            label.textColor = fontColor
            return label
        } else if (component == 1) {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
            label.textAlignment = .center
            label.text = "."
            label.font = UIFont.systemFont(ofSize:24.0)
            label.textColor = fontColor
            return label
        } else {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
            label.textAlignment = .center
            label.text = decimalDataArray[row]
            label.font = UIFont.systemFont(ofSize:24.0)
            label.textColor = fontColor
            return label
        }
        
//        } else {
            /*
            let productIndex:Int   = brandPickerView_.selectedRow(inComponent:0)
            let productDataArray_  = productAllDataArray_![productIndex]
            let productName:String = productDataArray_[row]
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
            label.textAlignment = .center
            label.text = productName
            label.font = UIFont.systemFont(ofSize:24.0)
            label.textColor = fontColor
            return label
             */
//        }
    }
    
    // pickerに表示する値を返す
    /*
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     
     let makerName:String
     if (row < brandDataArray_.count) {
     makerName = brandDataArray_[row]
     } else {
     makerName = ""
     }
     
     if (component == 0) {
     return makerName
     } else {
     if (row < brandDataArray_.count) {
     return brandDataArray_[row]
     }
     }
     
     return ""
     }
     */
    
    // pickerが選択された際に呼ばれる
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
                    inComponent component: Int) {

 
        /*
        if (pickerView.tag == 1) {
            selectedBrandIndex_ = row
            return
        } else {
            return
        }
         */
        
        /*
         let dataServer = DataServer.shared
         if (row == 0) {
         dataServer.setCountry(Country.Japan)
         } else if (row == 1) {
         dataServer.setCountry(Country.Other)
         }
         */
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
