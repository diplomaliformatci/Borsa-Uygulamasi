//
//  HaberCell.swift
//  Deneme
//
//  Created by Can KINCAL on 18/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import UIKit

class HaberCell: UITableViewCell {

    @IBOutlet weak var haberImg: UIImageView!
    
    @IBOutlet weak var haberDateLbl: UILabel!
    
    @IBOutlet weak var haberTextField: UITextView!
    
    override func awakeFromNib() {
    
        super.awakeFromNib()
        // Initialization code
    
    }
    
    
    func configurecell(haber: Haber) {
        self.haberDateLbl.text = haber.haberDate
        self.haberTextField.text = haber.haberText
    }
    
    
    // for test data no need that function
    func configurecell (text: String , image: UIImage ) {
        self.haberDateLbl.text = "17/04/1996"
        self.haberTextField.text = text
        self.haberImg.image = image
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
