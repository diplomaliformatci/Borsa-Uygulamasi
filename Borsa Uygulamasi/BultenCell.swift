//
//  BultenCell.swift
//  Deneme 1
//
//  Created by Can KINCAL on 15/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import UIKit

class BultenCell: UITableViewCell {

//    var _anaGrup: String!
//    var _anaGrup_ENG: String!
//    var _anaGrup_ISP: String!
//    var _altGrup: String!
//    var _altGrup_ENG: String!
//    var _altGrup_ISP: String!
//    var _mal : String!
//    var _mal_ENG: String!
//    var _mal_ISP: String!
//    var _malKod: String!
//    var _anaKod: String!
//    var _altKod: String!
//    var _esasBirim: String!
//    var _yardBRM: String!
//    var _minFiyat: String!
//    var _maxFiyat: String!
//    var _ortFiyat: String!
//    var _miktar: String!
//    var _ilkMiktar: String!
//    var _tutar: String!
//    var _satis: String!
//    var _muamele: String!
    
    
    @IBOutlet weak var altGrup: UILabel!
    
    @IBOutlet weak var minFiyat: UILabel!
 

    @IBOutlet weak var satisSekli: UILabel!
    

    @IBOutlet weak var maxFiyat: UILabel!
    
    @IBOutlet weak var ortFiyat: UILabel!
   
    @IBOutlet weak var islemAdedi: UILabel!
    
    @IBOutlet weak var miktar: UILabel!
    
    
    
    func configureCell(bulten: Bulten) {
        self.altGrup.text = bulten._mal
        self.minFiyat.text = bulten._minFiyat
        self.satisSekli.text = bulten._satis
        self.maxFiyat.text = bulten._maxFiyat
        self.ortFiyat.text = bulten._ortFiyat
        self.islemAdedi.text = bulten._muamele
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
