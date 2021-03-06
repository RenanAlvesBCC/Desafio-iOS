//
//  AliensTableViewCell.swift
//  Desafio AGSoft iOS
//
//  Created by Renan Alves on 05/02/19.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import UIKit

class AliensTableViewCell: UITableViewCell {


    @IBOutlet weak var imgAliens: UIImageView!
    @IBOutlet weak var lblNames: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor(named: "Dark Blue")
        self.lblNames.textColor = UIColor(named: "Yellow")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
