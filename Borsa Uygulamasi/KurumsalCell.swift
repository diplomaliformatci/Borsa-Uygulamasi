//
//  KurumsalCell.swift
//  Deneme
//
//  Created by Can KINCAL on 16/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import UIKit

class KurumsalCell: UITableViewCell {
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func configureCell(description: String) {
        self.descriptionLbl.text = description
    }
}
