//
//  Haber.swift
//  Deneme
//
//  Created by Can KINCAL on 18/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import UIKit


class Haber  {
    private var _haberImgUrl: String!
    private var _haberText: String!
    private var _haberDate: String!
    
    var haberImgUrl: String {
        if _haberImgUrl == nil {
           return ""
        }
        return _haberImgUrl
    }
    
    var haberText: String {
        if _haberText == nil {
            return ""
        }
        return _haberText
    }
    
    var haberDate : String {
        if _haberDate == nil {
            return ""
        }
        return _haberDate
    }
    
}
