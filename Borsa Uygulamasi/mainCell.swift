//
//  mainCell.swift
//  Deneme
//
//  Created by Can KINCAL on 16/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import UIKit

class mainCell: UICollectionViewCell {
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainLbl: UILabel!
    
    func configureCell(name: String) {
        self.mainLbl.text = name
    }
    
}
