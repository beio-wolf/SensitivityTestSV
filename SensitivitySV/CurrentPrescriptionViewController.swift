//
//  CurrentPrescriptionViewController.swift
//  SensitivitySV
//
//  Created by 森邦彦 on 2018/03/21.
//  Copyright © 2018年 Nicon-Essilor. All rights reserved.
//

import UIKit

let currentPrescriptionPickerView0 = UIPickerView()
let currentPrescriptionPickerView1 = UIPickerView()
let currentPrescriptionPickerView2 = UIPickerView()
let currentPrescriptionPickerView3 = UIPickerView()

var currentIntDataArrayS = ["+10", "+9", "+8", "+7", "+6", "+5", "+4", "+3", "+2", "+1", "+0",
                           "-0", "-1", "-2", "-3", "-4", "-5", "-6", "-7", "-8", "-9", "-10",
                           "-11", "-12", "-13", "-14", "-15", "-16"]

var currentIntDataArrayC = ["+6", "+5", "+4", "+3", "+2", "+1", "+0",
                            "-0", "-1", "-2", "-3", "-4", "-5", "-6"]

var currentDecimalDataArray = ["00", "25", "50", "75"]


class CurrentPrescriptionViewController: UIViewController,
                                         UITextFieldDelegate,
                                         UIPickerViewDataSource,
                                         UIPickerViewDelegate{
    // テキストフィールドの種類
    enum TextFieldType {
        case RightS     // 右S
        case RightC     // 右C
        case LeftS      // 左S
        case LeftC      // 左C
    }

    @IBOutlet weak var currentPrescriptionTextField0_: UITextField!
    @IBOutlet weak var currentPrescriptionTextField1_: UITextField!
    @IBOutlet weak var currentPrescriptionTextField2_: UITextField!
    @IBOutlet weak var currentPrescriptionTextField3_: UITextField!
    
    @IBOutlet weak var KeyDownView_: UIView!
    
    @IBAction func tappedGoToNextButton(_ sender: Any) {
        
        let dataServer = DataServer.shared
        let lensType = dataServer.getLensType()

        if (lensType == LensType.SingleVision) {
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier:"ConfarmFar")
            nextVC?.modalTransitionStyle = .crossDissolve
            present(nextVC!, animated: false, completion: nil)
        } else {
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier:"ConfarmNear")
            nextVC?.modalTransitionStyle = .crossDissolve
            present(nextVC!, animated: false, completion: nil)
        }
    }
    
    var currentTextFieldType_:TextFieldType = TextFieldType.RightS
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let dataServer = DataServer.shared
        let region = dataServer.getRegion()
 
        currentPrescriptionTextField0_.delegate = self
        currentPrescriptionTextField1_.delegate = self
        currentPrescriptionTextField2_.delegate = self
        currentPrescriptionTextField3_.delegate = self

        // タップでキーボードを引っ込めるViewの設定
        KeyDownView_.isUserInteractionEnabled = true
        KeyDownView_.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                 action: #selector(self.tappedKeyDown(sender:))))
        
        let fontColor:UIColor = UIColor(red:0.231372549,
                                        green:0.250980392,
                                        blue:0.294117647,
                                        alpha:1.0)
        
        // 初期値を設定
        dataServer.setCurrentPrescriptionR_S(0.0)
        dataServer.setCurrentPrescriptionR_C(0.0)
        dataServer.setCurrentPrescriptionL_S(0.0)
        dataServer.setCurrentPrescriptionL_C(0.0)

        if (region == Region.US) {
            do {
                currentPrescriptionPickerView0.frame = CGRect(x:0, y:0,
                                                width:UIScreen.main.bounds.size.width,
                                                height:currentPrescriptionPickerView0.bounds.size.height)
                currentPrescriptionPickerView0.delegate   = self
                currentPrescriptionPickerView0.dataSource = self
                currentPrescriptionPickerView0.selectRow(10, inComponent: 0, animated: false)
                currentPrescriptionPickerView0.selectRow(0, inComponent: 1, animated: false)
                currentPrescriptionPickerView0.selectRow(0, inComponent: 2, animated: false)

                let pointLabel = UILabel()
                pointLabel.frame = CGRect(x: 505,
                                          y: 110,
                                          width: 100,
                                          height: 100)
                pointLabel.text = "●"
                pointLabel.sizeToFit()
                pointLabel.font = UIFont.systemFont(ofSize:6.0)
                currentPrescriptionPickerView0.addSubview(pointLabel)

                let view0 = UIView(frame: currentPrescriptionPickerView0.bounds)
                view0.backgroundColor = UIColor.white
                view0.addSubview(currentPrescriptionPickerView0)
                
                currentPrescriptionTextField0_.inputView = view0
                
                let toolBar0 = UIToolbar()
                toolBar0.barStyle = UIBarStyle.default
                toolBar0.isTranslucent = true
                toolBar0.tintColor = UIColor.black
                let doneButton0   = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneEndPressed0))
                doneButton0.tintColor = fontColor
                let cancelButton0 = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed0))
                cancelButton0.tintColor = fontColor
                let spaceButton0  = UIBarButtonItem(barButtonSystemItem:    UIBarButtonSystemItem.flexibleSpace,
                                                    target: nil,
                                                    action: nil)
                toolBar0.setItems([spaceButton0, cancelButton0, spaceButton0, doneButton0, spaceButton0], animated: false)
                toolBar0.isUserInteractionEnabled = true
                toolBar0.sizeToFit()
                currentPrescriptionTextField0_.inputAccessoryView = toolBar0
                currentPrescriptionTextField0_.text = "+0.00"

            }
            
            do {
                currentPrescriptionPickerView1.frame = CGRect(x:0, y:0,
                                                      width:UIScreen.main.bounds.size.width,
                                                      height:currentPrescriptionPickerView1.bounds.size.height)
                currentPrescriptionPickerView1.delegate   = self
                currentPrescriptionPickerView1.dataSource = self
                currentPrescriptionPickerView1.selectRow(6, inComponent: 0, animated: false)
                currentPrescriptionPickerView1.selectRow(0, inComponent: 1, animated: false)
                currentPrescriptionPickerView1.selectRow(0, inComponent: 2, animated: false)

                let pointLabel = UILabel()
                pointLabel.frame = CGRect(x: 505,
                                          y: 110,
                                          width: 100,
                                          height: 100)
                pointLabel.text = "●"
                pointLabel.sizeToFit()
                pointLabel.font = UIFont.systemFont(ofSize:6.0)
                currentPrescriptionPickerView1.addSubview(pointLabel)
                
                let view1 = UIView(frame: currentPrescriptionPickerView1.bounds)
                view1.backgroundColor = UIColor.white
                view1.addSubview(currentPrescriptionPickerView1)
                
                currentPrescriptionTextField1_.inputView = view1
                
                let toolBar1 = UIToolbar()
                toolBar1.barStyle = UIBarStyle.default
                toolBar1.isTranslucent = true
                toolBar1.tintColor = UIColor.black
                let doneButton1   = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneEndPressed1))
                doneButton1.tintColor = fontColor
                let cancelButton1 = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed1))
                cancelButton1.tintColor = fontColor
                let spaceButton1  = UIBarButtonItem(barButtonSystemItem:    UIBarButtonSystemItem.flexibleSpace,
                                                    target: nil,
                                                    action: nil)
                toolBar1.setItems([spaceButton1, cancelButton1, spaceButton1, doneButton1, spaceButton1], animated: false)
                toolBar1.isUserInteractionEnabled = true
                toolBar1.sizeToFit()
                currentPrescriptionTextField1_.inputAccessoryView = toolBar1
                currentPrescriptionTextField1_.text = "+0.00"

            }
            
            do {
                currentPrescriptionPickerView2.frame = CGRect(x:0, y:0,
                                                       width:UIScreen.main.bounds.size.width,
                                                       height:currentPrescriptionPickerView2.bounds.size.height)
                currentPrescriptionPickerView2.delegate   = self
                currentPrescriptionPickerView2.dataSource = self
                currentPrescriptionPickerView2.selectRow(10, inComponent: 0, animated: false)
                currentPrescriptionPickerView2.selectRow(0, inComponent: 1, animated: false)
                currentPrescriptionPickerView2.selectRow(0, inComponent: 2, animated: false)

                let pointLabel = UILabel()
                pointLabel.frame = CGRect(x: 505,
                                          y: 110,
                                          width: 100,
                                          height: 100)
                pointLabel.text = "●"
                pointLabel.sizeToFit()
                pointLabel.font = UIFont.systemFont(ofSize:6.0)
                currentPrescriptionPickerView2.addSubview(pointLabel)
                
                let view2 = UIView(frame: currentPrescriptionPickerView2.bounds)
                view2.backgroundColor = UIColor.white
                view2.addSubview(currentPrescriptionPickerView2)
                
                currentPrescriptionTextField2_.inputView = view2
                
                let toolBar2 = UIToolbar()
                toolBar2.barStyle = UIBarStyle.default
                toolBar2.isTranslucent = true
                toolBar2.tintColor = UIColor.black
                let doneButton2   = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneEndPressed2))
                doneButton2.tintColor = fontColor
                let cancelButton2 = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed2))
                cancelButton2.tintColor = fontColor
                let spaceButton2  = UIBarButtonItem(barButtonSystemItem:    UIBarButtonSystemItem.flexibleSpace,
                                                    target: nil,
                                                    action: nil)
                toolBar2.setItems([spaceButton2, cancelButton2, spaceButton2, doneButton2, spaceButton2], animated: false)
                toolBar2.isUserInteractionEnabled = true
                toolBar2.sizeToFit()
                currentPrescriptionTextField2_.inputAccessoryView = toolBar2
                currentPrescriptionTextField2_.text = "+0.00"
            }
            
            do {
                currentPrescriptionPickerView3.frame = CGRect(x:0, y:0,
                                                       width:UIScreen.main.bounds.size.width,
                                                       height:currentPrescriptionPickerView3.bounds.size.height)
                currentPrescriptionPickerView3.delegate   = self
                currentPrescriptionPickerView3.dataSource = self
                currentPrescriptionPickerView3.selectRow(6, inComponent: 0, animated: false)
                currentPrescriptionPickerView3.selectRow(0, inComponent: 1, animated: false)
                currentPrescriptionPickerView3.selectRow(0, inComponent: 2, animated: false)

                let pointLabel = UILabel()
                pointLabel.frame = CGRect(x: 505,
                                          y: 110,
                                          width: 100,
                                          height: 100)
                pointLabel.text = "●"
                pointLabel.sizeToFit()
                pointLabel.font = UIFont.systemFont(ofSize:6.0)
                currentPrescriptionPickerView3.addSubview(pointLabel)

                let view3 = UIView(frame: currentPrescriptionPickerView3.bounds)
                view3.backgroundColor = UIColor.white
                view3.addSubview(currentPrescriptionPickerView3)
                
                currentPrescriptionTextField3_.inputView = view3
                
                let toolBar3 = UIToolbar()
                toolBar3.barStyle = UIBarStyle.default
                toolBar3.isTranslucent = true
                toolBar3.tintColor = UIColor.black
                let doneButton3   = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneEndPressed3))
                doneButton3.tintColor = fontColor
                let cancelButton3 = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed3))
                cancelButton3.tintColor = fontColor
                let spaceButton3  = UIBarButtonItem(barButtonSystemItem:    UIBarButtonSystemItem.flexibleSpace,
                                                    target: nil,
                                                    action: nil)
                toolBar3.setItems([spaceButton3, cancelButton3, spaceButton3, doneButton3, spaceButton3], animated: false)
                toolBar3.isUserInteractionEnabled = true
                toolBar3.sizeToFit()
                currentPrescriptionTextField3_.inputAccessoryView = toolBar3
                currentPrescriptionTextField3_.text = "+0.00"
            }

        } else if (region == Region.JP) {
            
            do {
                currentPrescriptionPickerView0.frame = CGRect(x:0, y:0,
                                                       width:UIScreen.main.bounds.size.width,
                                                       height:prescriptionPickerView0.bounds.size.height)
                currentPrescriptionPickerView0.delegate   = self
                currentPrescriptionPickerView0.dataSource = self
                currentPrescriptionPickerView0.selectRow(10, inComponent: 0, animated: false)
                currentPrescriptionPickerView0.selectRow(0, inComponent: 1, animated: false)
                currentPrescriptionPickerView0.selectRow(0, inComponent: 2, animated: false)
                
                let pointLabel = UILabel()
                pointLabel.frame = CGRect(x: 505,
                                          y: 110,
                                          width: 100,
                                          height: 100)
                pointLabel.text = "●"
                pointLabel.sizeToFit()
                pointLabel.font = UIFont.systemFont(ofSize:6.0)
                currentPrescriptionPickerView0.addSubview(pointLabel)

                let view0 = UIView(frame: currentPrescriptionPickerView0.bounds)
                view0.backgroundColor = UIColor.white
                view0.addSubview(currentPrescriptionPickerView0)
                
                currentPrescriptionTextField0_.inputView = view0
                
                let toolBar0 = UIToolbar()
                toolBar0.barStyle = UIBarStyle.default
                toolBar0.isTranslucent = true
                toolBar0.tintColor = UIColor.black
                let doneButton0   = UIBarButtonItem(title: "決定", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneEndPressed0))
                doneButton0.tintColor = fontColor
                let cancelButton0 = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed0))
                cancelButton0.tintColor = fontColor
                let spaceButton0  = UIBarButtonItem(barButtonSystemItem:    UIBarButtonSystemItem.flexibleSpace,
                                                    target: nil,
                                                    action: nil)
                toolBar0.setItems([spaceButton0, cancelButton0, spaceButton0,           doneButton0, spaceButton0], animated: false)
                toolBar0.isUserInteractionEnabled = true
                toolBar0.sizeToFit()
                currentPrescriptionTextField0_.inputAccessoryView = toolBar0
                currentPrescriptionTextField0_.text = "+0.00"
            }
            
            do {
                currentPrescriptionPickerView1.frame = CGRect(x:0, y:0,
                                                       width:UIScreen.main.bounds.size.width,
                                                       height:currentPrescriptionPickerView1.bounds.size.height)
                currentPrescriptionPickerView1.delegate   = self
                currentPrescriptionPickerView1.dataSource = self
                currentPrescriptionPickerView1.selectRow(6, inComponent: 0, animated: false)
                currentPrescriptionPickerView1.selectRow(0, inComponent: 1, animated: false)
                currentPrescriptionPickerView1.selectRow(0, inComponent: 2, animated: false)
                
                let pointLabel = UILabel()
                pointLabel.frame = CGRect(x: 505,
                                          y: 110,
                                          width: 100,
                                          height: 100)
                pointLabel.text = "●"
                pointLabel.sizeToFit()
                pointLabel.font = UIFont.systemFont(ofSize:6.0)
                currentPrescriptionPickerView1.addSubview(pointLabel)
                
                let view1 = UIView(frame: currentPrescriptionPickerView1.bounds)
                view1.backgroundColor = UIColor.white
                view1.addSubview(currentPrescriptionPickerView1)
                
                currentPrescriptionTextField1_.inputView = view1
                
                let toolBar1 = UIToolbar()
                toolBar1.barStyle = UIBarStyle.default
                toolBar1.isTranslucent = true
                toolBar1.tintColor = UIColor.black
                let doneButton1   = UIBarButtonItem(title: "決定", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneEndPressed1))
                doneButton1.tintColor = fontColor
                let cancelButton1 = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed1))
                cancelButton1.tintColor = fontColor
                let spaceButton1  = UIBarButtonItem(barButtonSystemItem:    UIBarButtonSystemItem.flexibleSpace,
                                                    target: nil,
                                                    action: nil)
                toolBar1.setItems([spaceButton1, cancelButton1, spaceButton1, doneButton1, spaceButton1], animated: false)
                toolBar1.isUserInteractionEnabled = true
                toolBar1.sizeToFit()
                currentPrescriptionTextField1_.inputAccessoryView = toolBar1
                currentPrescriptionTextField1_.text = "+0.00"
            }
            
            do {
                currentPrescriptionPickerView2.frame = CGRect(x:0, y:0,
                                                       width:UIScreen.main.bounds.size.width,
                                                       height:currentPrescriptionPickerView2.bounds.size.height)
                currentPrescriptionPickerView2.delegate   = self
                currentPrescriptionPickerView2.dataSource = self
                currentPrescriptionPickerView2.selectRow(10, inComponent: 0, animated: false)
                currentPrescriptionPickerView2.selectRow(0, inComponent: 1, animated: false)
                currentPrescriptionPickerView2.selectRow(0, inComponent: 2, animated: false)

                let pointLabel = UILabel()
                pointLabel.frame = CGRect(x: 505,
                                          y: 110,
                                          width: 100,
                                          height: 100)
                pointLabel.text = "●"
                pointLabel.sizeToFit()
                pointLabel.font = UIFont.systemFont(ofSize:6.0)
                currentPrescriptionPickerView2.addSubview(pointLabel)
                
                let view2 = UIView(frame: currentPrescriptionPickerView2.bounds)
                view2.backgroundColor = UIColor.white
                view2.addSubview(currentPrescriptionPickerView2)
                
                currentPrescriptionTextField2_.inputView = view2
                
                let toolBar2 = UIToolbar()
                toolBar2.barStyle = UIBarStyle.default
                toolBar2.isTranslucent = true
                toolBar2.tintColor = UIColor.black
                let doneButton2   = UIBarButtonItem(title: "決定", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneEndPressed2))
                doneButton2.tintColor = fontColor
                let cancelButton2 = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed2))
                cancelButton2.tintColor = fontColor
                let spaceButton2  = UIBarButtonItem(barButtonSystemItem:    UIBarButtonSystemItem.flexibleSpace,
                                                    target: nil,
                                                    action: nil)
                toolBar2.setItems([spaceButton2, cancelButton2, spaceButton2, doneButton2, spaceButton2], animated: false)
                toolBar2.isUserInteractionEnabled = true
                toolBar2.sizeToFit()
                currentPrescriptionTextField2_.inputAccessoryView = toolBar2
                currentPrescriptionTextField2_.text = "+0.00"
            }
            
            do {
                currentPrescriptionPickerView3.frame = CGRect(x:0, y:0,
                                                       width:UIScreen.main.bounds.size.width,
                                                       height:currentPrescriptionPickerView3.bounds.size.height)
                currentPrescriptionPickerView3.delegate   = self
                currentPrescriptionPickerView3.dataSource = self
                currentPrescriptionPickerView3.selectRow(6, inComponent: 0, animated: false)
                currentPrescriptionPickerView3.selectRow(0, inComponent: 1, animated: false)
                currentPrescriptionPickerView3.selectRow(0, inComponent: 2, animated: false)

                let pointLabel = UILabel()
                pointLabel.frame = CGRect(x: 505,
                                          y: 110,
                                          width: 100,
                                          height: 100)
                pointLabel.text = "●"
                pointLabel.sizeToFit()
                pointLabel.font = UIFont.systemFont(ofSize:6.0)
                currentPrescriptionPickerView3.addSubview(pointLabel)

                let view3 = UIView(frame: currentPrescriptionPickerView3.bounds)
                view3.backgroundColor = UIColor.white
                view3.addSubview(currentPrescriptionPickerView3)
                
                currentPrescriptionTextField3_.inputView = view3
                
                let toolBar3 = UIToolbar()
                toolBar3.barStyle = UIBarStyle.default
                toolBar3.isTranslucent = true
                toolBar3.tintColor = UIColor.black
                let doneButton3   = UIBarButtonItem(title: "決定", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneEndPressed3))
                doneButton3.tintColor = fontColor
                let cancelButton3 = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed3))
                cancelButton3.tintColor = fontColor
                let spaceButton3  = UIBarButtonItem(barButtonSystemItem:    UIBarButtonSystemItem.flexibleSpace,
                                                    target: nil,
                                                    action: nil)
                toolBar3.setItems([spaceButton3, cancelButton3, spaceButton3, doneButton3, spaceButton3], animated: false)
                toolBar3.isUserInteractionEnabled = true
                toolBar3.sizeToFit()
                currentPrescriptionTextField3_.inputAccessoryView = toolBar3
                currentPrescriptionTextField3_.text = "+0.00"
            }
        } else {
            print("Invalid region")
        }
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    @objc func tappedKeyDown(sender: UITapGestureRecognizer) {
        
        currentPrescriptionTextField0_.resignFirstResponder()
        currentPrescriptionTextField1_.resignFirstResponder()
        currentPrescriptionTextField2_.resignFirstResponder()
        currentPrescriptionTextField3_.resignFirstResponder()
        
        donePressed0()
        donePressed1()
        donePressed2()
        donePressed3()
    }
    
    // Done
    @objc func donePressed0() {
        
        let intIndex:Int = currentPrescriptionPickerView0.selectedRow(inComponent: 0)
        let intName:String = intDataArrayS[intIndex]

        let decimalIndex:Int = currentPrescriptionPickerView0.selectedRow(inComponent: 2)
        let decimalName:String = decimalDataArray[decimalIndex]

        currentPrescriptionTextField0_.text = intName + "." + decimalName

        // 選択された値を保存
        let dataServer = DataServer.shared
        dataServer.setCurrentPrescriptionR_S(Float(currentPrescriptionTextField0_.text!)!)
        
//        view.endEditing(true)
    }

    @objc func donePressed1() {
        
        let intIndex:Int = currentPrescriptionPickerView1.selectedRow(inComponent: 0)
        let intName:String = intDataArrayC[intIndex]
        
        let decimalIndex:Int = currentPrescriptionPickerView1.selectedRow(inComponent: 2)
        let decimalName:String = decimalDataArray[decimalIndex]
        
        currentPrescriptionTextField1_.text = intName + "." + decimalName
        
        // 選択された値を保存
        let dataServer = DataServer.shared
        dataServer.setCurrentPrescriptionR_C(Float(currentPrescriptionTextField1_.text!)!)

//        view.endEditing(true)
    }

    @objc func donePressed2() {
        
        let intIndex:Int = currentPrescriptionPickerView2.selectedRow(inComponent: 0)
        let intName:String = intDataArrayS[intIndex]
        
        let decimalIndex:Int = currentPrescriptionPickerView2.selectedRow(inComponent: 2)
        let decimalName:String = decimalDataArray[decimalIndex]
        
        currentPrescriptionTextField2_.text = intName + "." + decimalName
        
        // 選択された値を保存
        let dataServer = DataServer.shared
        dataServer.setCurrentPrescriptionL_S(Float(currentPrescriptionTextField2_.text!)!)
        
//        view.endEditing(true)
    }
    
    @objc func donePressed3() {
        
        let intIndex:Int = currentPrescriptionPickerView3.selectedRow(inComponent: 0)
        let intName:String = intDataArrayC[intIndex]
        
        let decimalIndex:Int = currentPrescriptionPickerView3.selectedRow(inComponent: 2)
        let decimalName:String = decimalDataArray[decimalIndex]
        
        currentPrescriptionTextField3_.text = intName + "." + decimalName
        
        // 選択された値を保存
        let dataServer = DataServer.shared
        dataServer.setCurrentPrescriptionL_C(Float(currentPrescriptionTextField3_.text!)!)

//        view.endEditing(true)
    }

    // DoneEnd
    @objc func doneEndPressed0() {
        
        donePressed0()
        view.endEditing(true)
    }
    
    @objc func doneEndPressed1() {
        
        donePressed1()
        view.endEditing(true)
    }
    
    @objc func doneEndPressed2() {
        
        donePressed2()
        view.endEditing(true)
    }
    
    @objc func doneEndPressed3() {
        
        donePressed3()
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

    ////// テキストフィールドのプロトコル //////
    //キーボードのReturnキーを押してテキストフィールドの入力が完了した直後
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.endEditing(true)
    }
    
    //テキストフィールドをタップして文字が入力可能になる直前
    //戻り値true：文字入力可能状態
    //戻り値false：入力不可でキーボード表示されない。
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if (textField == currentPrescriptionTextField0_) {
            currentTextFieldType_ = TextFieldType.RightS
        }
        else if (textField == currentPrescriptionTextField1_) {
            currentTextFieldType_ = TextFieldType.RightC
        }
        else if (textField == currentPrescriptionTextField2_) {
            currentTextFieldType_ = TextFieldType.LeftS
        }
        else if (textField == currentPrescriptionTextField3_) {
            currentTextFieldType_ = TextFieldType.LeftC
        }
        
        donePressed0()
        donePressed1()
        donePressed2()
        donePressed3()
        
        return true
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
            if ((currentTextFieldType_ == TextFieldType.RightS)
                || (currentTextFieldType_ == TextFieldType.LeftS)) {
                
                return intDataArrayS.count
            }
            else if ((currentTextFieldType_ == TextFieldType.RightC)
                || (currentTextFieldType_ == TextFieldType.LeftC)) {
                
                return intDataArrayC.count
            }
            return intDataArrayS.count
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
     func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {

        if (component == 0) {
            return 100
        } else if (component == 1) {
            return 100
        } else {
            return 100
        }
     }
    
    // pickerに表示するUIViewを返す
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let fontColor:UIColor = UIColor(red:0.231372549,
                                        green:0.250980392,
                                        blue:0.294117647,
                                        alpha:1.0)
        // 表示するラベルを生成する
        if (component == 0) {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            label.textAlignment = .right
            
            if ((currentTextFieldType_ == TextFieldType.RightS)
                || (currentTextFieldType_ == TextFieldType.LeftS)) {
                
                label.text = intDataArrayS[row]
            }
            else if ((currentTextFieldType_ == TextFieldType.RightC)
                || (currentTextFieldType_ == TextFieldType.LeftC)) {
                
                label.text = intDataArrayC[row]
            }
            
            label.font = UIFont.systemFont(ofSize:24.0)
            label.textColor = fontColor
            return label
        } else if (component == 1) {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            label.textAlignment = .center
            label.text = ""
            label.font = UIFont.systemFont(ofSize:12.0)
            label.textColor = fontColor
            return label
        } else {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            label.textAlignment = .left
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
