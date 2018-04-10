//
//  DataServer.swift
//  NiconLensWear
//
//  Created by 森邦彦 on 2017/11/06.
//  Copyright © 2017年 Nicon-Essilor. All rights reserved.
//

// 眼鏡の種類
enum GlassType {
    case TrialSet   // 治具
    case NormalSet  // 眼鏡
}

// 目の状態
enum EyeStatus {
    case Myope      // 近視
    case Hyperope   // 遠視
}

// リージョン
enum Region {
    case US     // 北米
    case CH1    // 中国１
    case CH2    // 中国２
    case JP     // 日本
}

// レンズタイプ
enum LensType {
    case SingleVision
    case SingleVisionForReadingGlasses
}

final class DataServer {
    
    // シングルトン
    private init() {}
    static let shared = DataServer()

    // 属性
    private var glassType_:GlassType = GlassType.TrialSet
    private var eyeStatus_:EyeStatus = EyeStatus.Myope
    private var region_:Region       = Region.US
    private var lensType_:LensType   = LensType.SingleVision
    private var comfirmIndex_:Int    = 0
    private var reConfirmIndex_:Int  = 0
    private var resultValue_:Int     = 0
    
    private var newestPrescriptionR_S_:Float = 0.0
    private var newestPrescriptionR_C_:Float = 0.0
    private var newestPrescriptionL_S_:Float = 0.0
    private var newestPrescriptionL_C_:Float = 0.0

    private var currentPrescriptionR_S_:Float = 0.0
    private var currentPrescriptionR_C_:Float = 0.0
    private var currentPrescriptionL_S_:Float = 0.0
    private var currentPrescriptionL_C_:Float = 0.0

    // アクセサー
    func getGlassType() -> GlassType {
        return glassType_
    }
    
    func setGlassType(_ newType:GlassType) {
        glassType_ = newType
    }

    func getEyeStatus() -> EyeStatus {
        return eyeStatus_
    }
    
    func setEyeStatus(_ newStatus:EyeStatus) {
        eyeStatus_ = newStatus
    }

    func getRegion() -> Region {
        return region_
    }
    
    func setRegion(_ newStatus:Region) {
        region_ = newStatus
    }
    
    func getLensType() -> LensType {
        return lensType_
    }
    
    func setLensType(_ newLensType:LensType) {
        lensType_ = newLensType
    }

    func getNewestPrescriptionR_S() -> Float {
        return newestPrescriptionR_S_
    }
    
    func setNewestPrescriptionR_S(_ newestPrescriptionR_S:Float) {
        newestPrescriptionR_S_ = newestPrescriptionR_S
    }
    
    func getNewestPrescriptionR_C() -> Float {
        return newestPrescriptionR_C_
    }
    
    func setNewestPrescriptionR_C(_ newestPrescriptionR_C:Float) {
        newestPrescriptionR_C_ = newestPrescriptionR_C
    }

    func getNewestPrescriptionL_S() -> Float {
        return newestPrescriptionL_S_
    }
    
    func setNewestPrescriptionL_S(_ newestPrescriptionL_S:Float) {
        newestPrescriptionL_S_ = newestPrescriptionL_S
    }
    
    func getNewestPrescriptionL_C() -> Float {
        return newestPrescriptionL_C_
    }
    
    func setNewestPrescriptionL_C(_ newestPrescriptionL_C:Float) {
        newestPrescriptionL_C_ = newestPrescriptionL_C
    }

    func getCurrentPrescriptionR_S() -> Float {
        return currentPrescriptionR_S_
    }
    
    func setCurrentPrescriptionR_S(_ currentPrescriptionR_S:Float) {
        currentPrescriptionR_S_ = currentPrescriptionR_S
    }
    
    func getCurrentPrescriptionR_C() -> Float {
        return currentPrescriptionR_C_
    }
    
    func setCurrentPrescriptionR_C(_ currentPrescriptionR_C:Float) {
        currentPrescriptionR_C_ = currentPrescriptionR_C
    }
    
    func getCurrentPrescriptionL_S() -> Float {
        return currentPrescriptionL_S_
    }
    
    func setCurrentPrescriptionL_S(_ currentPrescriptionL_S:Float) {
        currentPrescriptionL_S_ = currentPrescriptionL_S
    }
    
    func getCurrentPrescriptionL_C() -> Float {
        return currentPrescriptionL_C_
    }
    
    func setCurrentPrescriptionL_C(_ currentPrescriptionL_C:Float) {
        currentPrescriptionL_C_ = currentPrescriptionL_C
    }

    func getConfirmIndex() -> Int {
        return comfirmIndex_
    }
    
    func setConfirmIndex(_ newIndex:Int) {
        comfirmIndex_ = newIndex
    }

    func getReConfirmIndex() -> Int {
        return reConfirmIndex_
    }
    
    func setReConfirmIndex(_ newIndex:Int) {
        reConfirmIndex_ = newIndex
    }

    func getResultValue() -> Int {

        if ((comfirmIndex_ == 0) && (reConfirmIndex_ == 0)) {
            return -5
        } else if ((comfirmIndex_ == 0) && (reConfirmIndex_ == 1)) {
            return -5
        } else if ((comfirmIndex_ == 1) && (reConfirmIndex_ == 2)) {
            return -4
        } else if ((comfirmIndex_ == 2) && (reConfirmIndex_ == 3)) {
            return -3
        } else if ((comfirmIndex_ == 3) && (reConfirmIndex_ == 4)) {
            return -2
        } else if ((comfirmIndex_ == 4) && (reConfirmIndex_ == 5)) {
            return -1
        } else if ((comfirmIndex_ == 5) && (reConfirmIndex_ == 6)) {
            return 0
        } else if ((comfirmIndex_ == 6) && (reConfirmIndex_ == 7)) {
            return 1
        } else if ((comfirmIndex_ == 7) && (reConfirmIndex_ == 8)) {
            return 2
        } else if ((comfirmIndex_ == 8) && (reConfirmIndex_ == 9)) {
            return 3
        } else if ((comfirmIndex_ == 9) && (reConfirmIndex_ == 10)) {
            return 4
        } else if ((comfirmIndex_ == 10) && (reConfirmIndex_ == 11)) {
            return 5
        } else if ((comfirmIndex_ == 11) && (reConfirmIndex_ == 11)) {
            return 5
        }

        if ((comfirmIndex_ == 0) && (reConfirmIndex_ == 0)) {
            return -5
        } else if ((comfirmIndex_ == 1) && (reConfirmIndex_ == 0)) {
            return -5
        } else if ((comfirmIndex_ == 2) && (reConfirmIndex_ == 1)) {
            return -4
        } else if ((comfirmIndex_ == 3) && (reConfirmIndex_ == 2)) {
            return -3
        } else if ((comfirmIndex_ == 4) && (reConfirmIndex_ == 3)) {
            return -2
        } else if ((comfirmIndex_ == 5) && (reConfirmIndex_ == 4)) {
            return -1
        } else if ((comfirmIndex_ == 6) && (reConfirmIndex_ == 5)) {
            return 0
        } else if ((comfirmIndex_ == 7) && (reConfirmIndex_ == 6)) {
            return 1
        } else if ((comfirmIndex_ == 8) && (reConfirmIndex_ == 7)) {
            return 2
        } else if ((comfirmIndex_ == 9) && (reConfirmIndex_ == 8)) {
            return 3
        } else if ((comfirmIndex_ == 10) && (reConfirmIndex_ == 9)) {
            return 4
        } else if ((comfirmIndex_ == 11) && (reConfirmIndex_ == 10)) {
            return 5
        } else if ((comfirmIndex_ == 11) && (reConfirmIndex_ == 11)) {
            return 5
        }

        return -99
    }
    
    func setResultValue(_ newValue:Int) {
        resultValue_ = newValue
    }

}

// EOF
