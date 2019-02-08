//
//  EstatisticasViewController.swift
//  Desafio AGSoft iOS
//
//  Created by Renan Alves on 07/02/19.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import UIKit

class EstatisticsViewController: UIViewController {

    @IBOutlet weak var lblEstatistic: UILabel!
    var namesAliens = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let result = calculateOcurrenceInArray()
        if result.count != 0 {
            lblEstatistic.text = ""
            for dados in result {
                lblEstatistic.text?.append("\n Raça: \(dados.0) - Quantidade:\(dados.1)")
            }
        }else {
            lblEstatistic.text = "Nenhum dado encontrado até o momento."
        }
    }

    private func calculateOcurrenceInArray() -> [(String, Int)] {
        var aliens = [String]()
        for name in namesAliens {
            aliens.append(Alienigena(name: name).breed)
        }
        
        let dictionary = Dictionary(grouping: aliens, by: { $0 })
        
        let newArray = dictionary.map { (key: String, value: [String]) in
            return (key, value.count)
        }
        
        return newArray
    }
}
