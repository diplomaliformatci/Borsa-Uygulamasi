//
//  Bulten.swift
//  Deneme 1
//
//  Created by Can KINCAL on 15/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import Foundation
import Alamofire
class Bulten {
    var _anaGrup: String!
    var _anaGrup_ENG: String!
    var _anaGrup_ISP: String!
    var _altGrup: String!
    var _altGrup_ENG: String!
    var _altGrup_ISP: String!
    var _mal : String!
    var _mal_ENG: String!
    var _mal_ISP: String!
    var _malKod: String!
    var _anaKod: String!
    var _altKod: String!
    var _esasBirim: String!
    var _yardBRM: String!
    var _minFiyat: String!
    var _maxFiyat: String!
    var _ortFiyat: String!
    var _miktar: String!
    var _ilkMiktar: String!
    var _tutar: String!
    var _satis: String!
    var _muamele: String!
    
    
    //public struct App {
    //
    //  // MARK: - Properties
    //  public let name: String
    //  public let link: String
    //
    //  // MARK: - Initializers
    //
    //    public init (json: [String : Any]) throws {
    //        guard let container = json["im:name"] as? [String : Any] ,
    //            let name = container["label"] as? String else {
    //                throw SerializationError.missing("name")
    //        }
    //        guard let id = json["id"] as? [String: Any] ,
    //            let link = id["label"] as? String else {
    //                throw SerializationError.missing("link")
    //        }
    //
    //        self.name = name
    //        self.link = link
    //        
    //    }
    //    
    //}
    
    
    init(dict: [String : Any]) throws {
        _anaGrup = dict["ANAGRUP"] as? String
        _altGrup = dict["ALTGRUP"] as? String
        _altGrup_ENG = dict["ALTGRUP_ENG"] as? String
        _altGrup_ISP = dict["ALTGRUP_ISP"] as? String
        _mal = dict["MAL"] as? String
        _mal_ENG = dict["MAL_ENG"] as? String
        _mal_ENG = dict["MAL_ENG"] as? String
        _mal_ISP = dict["MAL_ISP"] as? String
        _malKod = dict["MALKOD"] as? String
        _anaKod = dict["ANAKOD"] as? String
        _altKod = dict["ALTKOD"] as? String
        _esasBirim = dict["ESASBRM"] as? String
        _yardBRM = dict["YARDBRM"] as? String
        _minFiyat = dict["MINFIYAT"] as? String
        _maxFiyat = dict["MAXFIYAT"] as? String
        _ortFiyat = dict["ORTFIYAT"] as? String
        _miktar = dict["MIKTAR"] as? String
        _ilkMiktar = dict["ILKMIKTAR"] as? String
        _tutar = dict["TUTAR"] as? String
        _satis = dict["SATIS"] as? String
        _muamele = dict["MUAMELE"] as? String
            //                                _anaGrup = anaGrup
            //                              if let anaGrup_ENG = dict["GRAIN"] as? String {
            //                                _anaGrup_ENG = anaGrup_ENG
            //                            }
            //                            if let anaGrup_ISP = dict["ANAGRUP_ISP"] as? String {
            //                                bultenTemp._anaGrup_ISP = anaGrup_ISP
            //                                print("\(anaGrup_ISP)")
            //                            }
            //
            //                            if let altGrup = dict["ALTGRUP"] as? String {
            //                                bultenTemp._altGrup = altGrup
            //                                print("\(altGrup)")
            //                            }
            //
            //                            if let altGrup_ENG = dict["ALTGRUP_ENG"] as? String {
            //                                bultenTemp._altGrup_ENG = altGrup_ENG
            //                                print("\(altGrup_ENG)")
            //                            }
            //
            //                            if let altGrup_ISP = dict["ALTGRUP_ISP"] as? String {
            //                                bultenTemp._altGrup_ISP = altGrup_ISP
            //                                print("\(bultenTemp.altGrup_ISP)")
            //                            }
            //
            //                            if let mal = dict["MAL"] as? String {
            //                                bultenTemp._mal = mal
            //                                print("\(bultenTemp.mal)")
            //                            }
            //
            //                            if let mal_ENG = dict["MAL_ENG"] as? String {
            //                                bultenTemp._mal_ENG = mal_ENG
            //                                print("\(bultenTemp.mal_ENG)")
            //                            }
            //
            //                            if let mal_ISP = dict["MAL_ISP"] as? String {
            //                                bultenTemp._mal_ISP = mal_ISP
            //                                print("\(bultenTemp.mal_ISP)")
            //                            }
            //
            //                            if let malKod = dict["MALKOD"] as? String {
            //                                bultenTemp._malKod = malKod
            //                                print("\(bultenTemp.malKod)")
            //                            }
            //
            //                            if let anaKod = dict["ANAKOD"] as? String {
            //                                bultenTemp._anaKod = anaKod
            //                                print("\(bultenTemp.anaKod)")
            //                            }
            //
            //                            if let altKod = dict["ALTKOD"] as? String {
            //                                bultenTemp._altKod = altKod
            //                                print("\(bultenTemp.altKod)")
            //                            }
            //
            //                            if let esasBirim = dict["ESASBRM"] as? String {
            //                                bultenTemp._esasBirim = esasBirim
            //                                print("\(bultenTemp.esasBirim)")
            //                            }
            //
            //                            if let yardBirim = dict["YARDBRM"] as? String {
            //                                bultenTemp._yardBRM = yardBirim
            //                                print("\(bultenTemp.yardBRM)")
            //                            }
            //
            //                            if let minFiyat = dict["MINFIYAT"] as? String {
            //                                bultenTemp._minFiyat = minFiyat
            //                                print("\(bultenTemp.minFiyat)")
            //                            }
            //
            //                            if let maxFiyat = dict["MAXFIYAT"] as? String {
            //                                bultenTemp._maxFiyat = maxFiyat
            //                                print("\(bultenTemp.maxFiyat)")
            //                            }
            //
            //                            if let ortFiyat = dict["ORTFIYAT"] as? String {
            //                                bultenTemp._ortFiyat = ortFiyat
            //                                print("\(bultenTemp.ortFiyat)")
            //                            }
            //
            //                            if let miktar = dict["MIKTAR"] as? String {
            //                                bultenTemp._miktar = miktar
            //                                print("\(bultenTemp.miktar)")
            //                            }
            //                            
            //                            if let ilkMiktar = dict["ILKMIKTAR"] as? String {
            //                                bultenTemp._ilkMiktar = ilkMiktar
            //                                print("\(bultenTemp.ilkMiktar)")
            //                            }
            //                            if let tutar = dict["TUTAR"] as? String {
            //                                bultenTemp._tutar = tutar
            //                                print("\(bultenTemp.tutar)")
            //                            }
            //                            
            //                            if let satis = dict["SATIS"] as? String {
            //                                bultenTemp._satis = satis
            //                                print("\(bultenTemp.satis)")
            //                            }
            //                            
            //                            if let muamele = dict["MUAMELE"] as? String {
            //                                bultenTemp._muamele = muamele
            //                                print("\(bultenTemp.muamele)")
            //                            }

    }
    
    
    
    
    
    
    
    
    
//    var anaGrup: String {
//        if _anaGrup == nil {
//            _anaGrup = ""
//        }
//        return _anaGrup
//    }
//    
//    var anaGrup_ENG: String{
//        if _anaGrup_ENG == nil {
//            _anaGrup = ""
//        }
//        return _anaGrup_ENG
//    }
//    
//    var anaGrup_ISP: String {
//        if _anaGrup_ISP == nil {
//            _anaGrup_ISP = ""
//        }
//        return _anaGrup_ISP
//    }
//    
//    var altGrup: String! {
//        if _altGrup == nil {
//            _altGrup = ""
//        }
//        return _altGrup
//    }
//    
//    var altGrup_ENG: String {
//        if _altGrup_ENG == nil {
//            _altGrup_ENG = ""
//        }
//        return _altGrup_ENG
//    }
//    
//    var altGrup_ISP: String {
//        if _altGrup_ISP == nil {
//            _altGrup_ISP = ""
//            }
//        
//        return _altGrup_ISP
//    }
//    
//    var mal: String {
//        if _mal == nil {
//            _mal = ""
//        }
//        return _mal
//    }
//    
//    var mal_ENG: String {
//        if _mal_ENG == nil {
//            _mal_ENG = ""
//        }
//        return _mal_ENG
//    }
//    
//    var mal_ISP: String {
//        if _mal_ISP == nil {
//            _mal_ISP = ""
//        }
//        return _mal_ISP
//    }
//    
//    var malKod: String {
//        if _malKod == nil {
//            _malKod = ""
//        }
//        return _malKod
//    }
//    
//    var anaKod: String {
//        if _anaKod == nil {
//            _anaKod = ""
//        }
//        return _anaKod
//    }
//    
//    var altKod: String {
//        if _altKod == nil {
//            _altKod = ""
//        }
//        
//        return _altKod
//    }
//    
//    var esasBirim: String {
//        if _esasBirim == nil {
//            _esasBirim = ""
//        }
//        return _esasBirim
//    }
//    
//    var yardBRM: String {
//        if _yardBRM == nil {
//            _yardBRM = ""
//        }
//        return _esasBirim
//    }
//    
//    var minFiyat: String {
//        if _minFiyat == nil {
//            _minFiyat = ""
//        }
//        return _minFiyat
//    }
//    
//    var maxFiyat: String {
//        if _maxFiyat == nil {
//            _maxFiyat = ""
//        }
//        return _maxFiyat
//    }
//    
//    var ortFiyat: String {
//        if _ortFiyat == nil {
//            _ortFiyat = ""
//        }
//        return _ortFiyat
//    }
//    
//    var miktar: String {
//        if _miktar == nil {
//            _miktar = ""
//        }
//        return _miktar
//    }
//    
//    var ilkMiktar: String {
//        if _ilkMiktar == nil {
//            _ilkMiktar = ""
//        }
//        return _ilkMiktar
//    }
//    
//    var tutar : String {
//        if _tutar == nil {
//            _tutar = ""
//        }
//        
//        return _tutar
//    }
//    
//    var satis: String {
//        if _satis == nil {
//            _satis = ""
//        }
//        return _satis
//    }
//    
//    
//    var muamele: String {
//        if _muamele == nil {
//            _muamele = ""
//        }
//        return _muamele
//    }
//   

}

