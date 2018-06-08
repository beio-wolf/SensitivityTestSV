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

// セッティング画面の場所
enum SettingPos {
    case Common // 共通
    case Module // 非共通
}

// 国
enum Country:Int {
    case Japan      // 日本
    case Other      // その他
}

// 試験種別
enum TestKind {
    case Near   // 近視
    case Far    // 遠視
}


final class DataServer {
    
    // シングルトン
    private init() {}
    static let shared = DataServer()

    // 属性
    private var glassType_:GlassType    = GlassType.TrialSet
    private var eyeStatus_:EyeStatus    = EyeStatus.Myope
    private var region_:Region          = Region.US
    private var lensType_:LensType      = LensType.SingleVision
    private var settingPos_:SettingPos  = SettingPos.Common
    private var country_:Country        = Country.Japan
    private var testKind_:TestKind      = TestKind.Far

    private var comfirmIndex_:Int       = 0
    private var reConfirmIndex_:Int     = 0
    private var resultValue_:Int        = 0
    private var nearResultIndex_:Int    = 0
    private var farResultIndex_:Int     = 0
    private var farIndex_:Int           = 0
    private var nearIndex_:Int          = 0
    
    private var newestPrescriptionR_S_:Float    = 0.0
    private var newestPrescriptionR_C_:Float    = 0.0
    private var newestPrescriptionR_Add_:Float  = 0.0
    private var newestPrescriptionL_S_:Float    = 0.0
    private var newestPrescriptionL_C_:Float    = 0.0
    private var newestPrescriptionL_Add_:Float  = 0.0

    private var currentPrescriptionR_S_:Float   = 0.0
    private var currentPrescriptionR_C_:Float   = 0.0
    private var currentPrescriptionR_Add_:Float = 0.0
    private var currentPrescriptionL_S_:Float   = 0.0
    private var currentPrescriptionL_C_:Float   = 0.0
    private var currentPrescriptionL_Add_:Float = 0.0

    private var lensTypeBrand_:Int      = 0
    private var lensTypeProduct_:Int    = 0
    
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

    func getCountry() -> Country {
        return country_
    }
    
    func setCountry(_ newStatus:Country) {
        country_ = newStatus
    }
    
    func getTestKind() -> TestKind {
        return testKind_
    }
    
    func setTestKind(_ newStatus: TestKind) {
        testKind_ = newStatus
    }
    
    func getSettingPos() -> SettingPos {
        return settingPos_
    }
    
    func setSettingPos(_ newStatus: SettingPos) {
        settingPos_ = newStatus
    }
    
    func getFarIndex() -> Int {
        return farIndex_
    }
    
    func setFarIndex(_ newIndex:Int) {
        farIndex_ = newIndex
    }
    
    func getNearIndex() -> Int {
        return nearIndex_
    }
    
    func setNearIndex(_ newIndex:Int) {
        nearIndex_ = newIndex
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

    func getNewestPrescriptionR_Add() -> Float {
        return newestPrescriptionR_Add_
    }
    
    func setNewestPrescriptionR_Add(_ newestPrescriptionR_Add:Float) {
        newestPrescriptionR_Add_ = newestPrescriptionR_Add
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

    func getNewestPrescriptionL_Add() -> Float {
        return newestPrescriptionL_Add_
    }
    
    func setNewestPrescriptionL_Add(_ newestPrescriptionL_Add:Float) {
        newestPrescriptionL_Add_ = newestPrescriptionL_Add
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
    
    func getCurrentPrescriptionR_Add() -> Float {
        return currentPrescriptionR_Add_
    }
    
    func setCurrentPrescriptionR_Add(_ currentPrescriptionR_Add:Float) {
        currentPrescriptionR_Add_ = currentPrescriptionR_Add
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

    func getCurrentPrescriptionL_Add() -> Float {
        return currentPrescriptionL_Add_
    }
    
    func setCurrentPrescriptionL_Add(_ currentPrescriptionL_Add:Float) {
        currentPrescriptionL_Add_ = currentPrescriptionL_Add
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

    func setNearResultIndex(_ newValue:Int) {
        nearResultIndex_ = newValue
    }
    
    func getNearResultValue() -> Int {
        
        switch nearResultIndex_ {
        case 0:
            return -5
        case 1:
            return -4
        case 2:
            return -4
        case 3:
            return -3
        case 4:
            return -3
        case 5:
            return -2
        case 6:
            return -1
        case 7:
            return 0
        case 8:
            return 1
        case 9:
            return 2
        case 10:
            return 2
        case 11:
            return 3
        case 12:
            return 3
        case 13:
            return 4
        case 14:
            return 4
        case 15:
            return 5
        case 16:
            return 5
        default:
            return -99
        }
    }
    
    func setFarResultIndex(_ newValue:Int) {
        farResultIndex_ = newValue
    }
    
    func getFarResultValue() -> Int {
        
        switch farResultIndex_ {
        case 0:
            return -5
        case 1:
            return -4
        case 2:
            return -4
        case 3:
            return -3
        case 4:
            return -3
        case 5:
            return -2
        case 6:
            return -1
        case 7:
            return 0
        case 8:
            return 1
        case 9:
            return 2
        case 10:
            return 2
        case 11:
            return 3
        case 12:
            return 3
        case 13:
            return 4
        case 14:
            return 4
        case 15:
            return 5
        case 16:
            return 5
        default:
            return -99
        }
    }
    
    func setLensTypeParam(_ brand:Int, product:Int) {
        lensTypeBrand_   = brand
        lensTypeProduct_ = product
    }
    
    func getLensTypeParam() -> Int {
        
        if (country_ == Country.Japan) {
            
            switch lensTypeBrand_ {
                
            case 0: // Nikon
                switch lensTypeProduct_ {
                case 0: // SEEPROUD Ai
                    return 11
                case 1: // Ai Original
                    return 12
                case 2: // Ai cyber
                    return 13
                case 3: // Ai Entry
                    return 14
                case 4: // Ai Smooth
                    return 15
                case 5: // SEEPROUD High Power
                    return 16
                case 6: // Presio High Power
                    return 17
                case 7: // Presio Power
                    return 18
                case 8: // Presio W
                    return 19
                case 9: // Seven
                    return 20
                case 10: // 中近タイプ
                    return 98
                case 11: // 不明・該当なし
                    return 10
                default:
                    return -99
                }
                
            case 1: // Varlux
                switch lensTypeProduct_ {
                case 0: // S 4D
                    return 32
                case 1: // S 3D
                    return 33
                case 2: // S
                    return 34
                case 3: // Definity
                    return 35
                case 4: // Physio
                    return 36
                case 5: // Comfort
                    return 37
                case 6: // 中近タイプ
                    return 98
                case 7: // 不明・該当なし
                    return 31
                default:
                    return -99
                }
                
            case 2: // Hoya
                switch lensTypeProduct_ {
                case 0: // Rsi
                    return 47
                case 1: // Msi/Msv Mild
                    return 48
                case 2: // Msi/Msv Harmony
                    return 49
                case 3: // Msi/Msv Clarity
                    return 50
                case 4: // Lsi/Lsv Harmony
                    return 51
                case 5: // Lsi/Lsv Clarity
                    return 52
                case 6: // Welna Harmony
                    return 53
                case 7: // Welna Clarity
                    return 54
                case 8: // SynchroField
                    return 55
                case 9: // iD/FD
                    return 56
                case 10:// 中近タイプ
                    return 98
                case 11:// 不明・該当なし
                    return 46
                default:
                    return -99
                }
                
            case 3: // Seiko
                switch lensTypeProduct_ {
                case 0: // SuperiorPX
                    return 62
                case 1: // SuperiorP1neo
                    return 63
                case 2: // SuperiorP1
                    return 64
                case 3: // Pursuit AC-X
                    return 65
                case 4: // Pursuit PV
                    return 66
                case 5: // Pursuit CV
                    return 67
                case 6: // Pursuit CV-X
                    return 68
                case 7: // Pursuit NV-X
                    return 69
                case 8: // Pursuit NV
                    return 70
                case 9: // Pursuit NVマイルド
                    return 71
                case 10:// 中近タイプ
                    return 98
                case 11:// 不明・該当なし
                    return 61
                default:
                    return -99
                }
                
            case 4: // Tokai
                switch lensTypeProduct_ {
                case 0: // ニューログラン
                    return 77
                case 1: // グラナス マイルドタイプ
                    return 78
                case 2: // グラナス クリアタイプ
                    return 79
                case 3: // レゾナスRマイチューン
                    return 80
                case 4: // レゾナスR
                    return 81
                case 5: // レゾナスフィットR
                    return 82
                case 6: // レゾナスマイチューン
                    return 83
                case 7: // レゾナス
                    return 84
                case 8: // レゾナスフィット
                    return 85
                case 9: // グレイス
                    return 86
                case 10:// 中近タイプ
                    return 98
                case 11:// 不明・該当なし
                    return 76
                default:
                    return -99
                }
                
            case 5: // Zeiss
                switch lensTypeProduct_ {
                    
                case 0: // Indivisual
                    return 92
                case 1: // 中近タイプ
                    return 98
                case 2: // 不明・該当なし
                    return 91
                default:
                    return -99
                }
                
            default:
                if (lensTypeBrand_ == 6) {
                    return 99
                } else {
                    return -99
                }
            }
        } else if (country_ == Country.Other) {
            
            switch lensTypeBrand_ {
                
            case 0: // Nikon
                switch lensTypeProduct_ {
                case 0: // SEEMAX MASTER
                    return 20
                case 1: // PRESIO MASTER
                    return 21
                case 2: // PRESIO POWER
                    return 22
                case 3: // PRESIO DIGILIFE Wide
                    return 23
                case 4: // PRESIO BALANCE
                    return 24
                case 5: // PRESIO i Focus
                    return 25
                case 6: // Mid PAL Type
                    return 98
                case 7: // Uncertain / NA
                    return 10
                default:
                    return -99
                }
                
            case 1: // Varlux
                switch lensTypeProduct_ {
                case 0: // S 4D
                    return 32
                case 1: // S 3D
                    return 33
                case 2: // S
                    return 34
                case 3: // Physio
                    return 36
                case 4: // Comfort
                    return 37
                case 5: // Mid PAL Type
                    return 98
                case 6: // Uncertain / NA
                    return 31
                default:
                    return -99
                }
                
            case 2: // Hoya
                switch lensTypeProduct_ {
                case 0: // iD MyStyle V+
                    return 48
                case 1: // iD LifeStyle V+
                    return 49
                case 2: // Mid PAL Type
                    return 98
                case 3: // Uncertain / NA
                    return 46
                default:
                    return -99
                }
                
            case 3: // Zeiss
                switch lensTypeProduct_ {
                case 0: // Indivisual
                    return 92
                case 1: // Mid PAL Type
                    return 98
                case 2: // Uncertain / NA
                    return 91
                default:
                    return -99
                }
                
            default:
                if (lensTypeBrand_ == 4) {
                    return 99
                } else {
                    return -99
                }
            }
        }
        return -99
    }
}

// EOF
