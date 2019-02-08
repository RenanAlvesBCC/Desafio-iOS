//
//  Alienigena.swift
//  Desafio AGSoft iOS
//
//  Created by Renan Alves on 05/02/19.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import UIKit
import ImageDetect
import GoogleMobileVision

struct Alienigena {
    var name = String()
    var birth = String()
    var image = UIImage()
    var genere = String()
    var breed = String()
    var issuanceDate = Date()
}


///Metodo para inicialiar o objeto alienigena com a foto cortada e os dados pessoas ja preencido.
extension Alienigena {
    
    init(name: String) {
        guard let imagemDocumento = UIImage(named: "\(name) - Documento.jpg") else { return }
        let datas = extractTextImage(image: imagemDocumento)
        self.name = datas[0]
        self.birth = datas[1]
        self.genere = datas[2]
        self.breed = datas[3]
        guard let imgCroop = UIImage(named: "\(name) - Foto.jpg") else { return }
        let imgCrooped = extractFaceImage(image: imgCroop)
        if imgCrooped != imgCroop {
            self.image = imgCrooped
        }
    }
    //MARK: - Frameworks.
    
    /// Metodo para extrair texto apartir de uma imagem.
    /// Este meto utiliza a framework GoogleMobileVisio para extrair os textos.
    ///
    /// - Parameter image: imagem a ser extraido os textos.
    /// - Returns: retorna apenas os textos checados pela validação.
    func extractTextImage(image: UIImage) -> [String] {
        var texts = [String]()
        
        let textDetector = GMVDetector(ofType: GMVDetectorTypeText, options: nil)
        if let features = textDetector?.features(in: image, options: nil) {
            for (index,textBlock) in features.enumerated() {
                //Iterando sobre todos os blocos de texto encontrado na imagem.
                if(index > 10 && index < 15) {
                    if let txt = textBlock.value(forKey: "_value") as? String {
                        texts.append(txt)
                    }
                }
            }
        }
        
        return texts
    }
    
    
    /// Metodo para extrair image das faces apartir de uma imagem grande.
    /// Este metodo usa a framework ImageDetect, que por baixo dessa interface, está implementando Vision, a propria maquina de aprendizado da apple.
    ///
    /// - Parameter image: imagem ampla.
    /// - Returns: retorna a imagem já cortada a face.
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


// MARK: - Codable
extension Alienigena: Codable {
    
    fileprivate enum CodingKeys: String, CodingKey {
        case alienModel
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let model = Alienigena(name: self.name)
        
        try container.encode(model,forKey: .alienModel)
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let model = try values.decode(Alienigena.self, forKey: Alienigena.CodingKeys.alienModel)
        self.init(name: model.name)
    }
}
