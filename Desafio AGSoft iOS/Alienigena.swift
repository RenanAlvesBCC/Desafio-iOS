//
//  Alienigena.swift
//  Desafio AGSoft iOS
//
//  Created by Renan Alves on 05/02/19.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import UIKit
import ImageDetect

struct Alienigena {
    var name = String()
    var dataNascimento = String()
    var foto = UIImage()
    var genero = String()
    var raca = String()
}

extension Alienigena {
    
    init(name: String) {
        self.name = name
        self.dataNascimento = ""
        self.raca = ""
        guard let imagem = UIImage(named: "\(name) - Foto.jpg") else { return }
        let imagemCortada = extractFaceImage(image: imagem)
        if imagemCortada != imagem {
            self.foto = imagemCortada
        }
    }
    
    func extractFaceImage(image: UIImage) -> UIImage {
        var retorno = UIImage()
        image.detector.crop(type: .face) { (result) in
            switch result {
            case .success(let imagemCortada):
                retorno = UIImage(cgImage: (imagemCortada.first?.cgImage)!)
            case .notFound:
                print("Face nÃo encontrada.")
                retorno = image
            case .failure(let erro):
                print("Erro durante o corte da face ",erro.localizedDescription)
                retorno = image
            }
        }
        return retorno
    }
}
