//
//  ConfirmaCadastroViewController.swift
//  Desafio AGSoft iOS
//
//  Created by Renan Alves on 07/02/19.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import UIKit

class ConfirmRegisterAlienViewController: UIViewController {

    
    @IBOutlet weak var imagemAlien: UIImageView!
    @IBOutlet weak var nomeAlien: UILabel!
    @IBOutlet weak var nascimentoAlien: UILabel!
    @IBOutlet weak var generoAlien: UILabel!
    @IBOutlet weak var racaAlien: UILabel!
    
    @IBAction func cancelaCadastro(_ sender: Any) {
        onDoneBlock!(false)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmaCadastro(_ sender: Any) {
        onDoneBlock!(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    var onDoneBlock : ((Bool) -> Void)?
    var alien: Alienigena?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagemAlien.image = alien?.image
        nomeAlien.text = alien?.name
        nascimentoAlien.text = alien?.birth
        generoAlien.text = alien?.genere
        racaAlien.text = alien?.breed
    }
    
}
