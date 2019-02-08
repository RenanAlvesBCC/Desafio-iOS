//
//  AlienDetailViewController.swift
//  Desafio AGSoft iOS
//
//  Created by Renan Alves on 05/02/19.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import UIKit

class PassporteAlien: UIViewController {

    @IBOutlet weak var imgAlien: UIImageView!
    @IBOutlet weak var nameAlien: UILabel!
    @IBOutlet weak var nascimentoAline: UILabel!
    @IBOutlet weak var genereAlien: UILabel!
    @IBOutlet weak var breedAlien: UILabel!
    
    var alien: Alienigena?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupAlien()
        setupNavigationController()
    }
    
    //MARK: - setups
    
    private func setupAlien() {
        imgAlien.image = alien?.image
        nameAlien.text = alien?.name
        nascimentoAline.text = alien?.birth
        genereAlien.text = alien?.genere
        breedAlien.text = alien?.breed
    }
    
    private func setupNavigationController() {
        self.navigationItem.title = alien?.name
    }

}
