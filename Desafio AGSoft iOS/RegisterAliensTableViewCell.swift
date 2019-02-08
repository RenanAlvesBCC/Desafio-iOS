//
//  AdicionaAliensTableViewCell.swift
//  Desafio AGSoft iOS
//
//  Created by Renan Alves on 07/02/19.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import UIKit

class RegisterAliensTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nomeAliens: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor(named: "Dark Blue")
        self.nomeAliens.textColor = UIColor(named: "Yellow")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
