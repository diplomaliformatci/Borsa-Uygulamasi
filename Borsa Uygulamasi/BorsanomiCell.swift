//
//  BorsanomiCell.swift
//  Deneme
//
//  Created by Can KINCAL on 23/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import UIKit

class BorsanomiCell: UICollectionViewCell {
    @IBOutlet weak var borsanomiImg: UIImageView!
    @IBOutlet weak var borsanomiLbl: UILabel!
 
    
    func configureCell(image: UIImage , title: String) {
        borsanomiImg.image = image
        borsanomiLbl.text = title
    }
    
    
}
