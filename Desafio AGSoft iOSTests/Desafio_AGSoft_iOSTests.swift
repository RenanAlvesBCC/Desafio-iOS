//
//  Desafio_AGSoft_iOSTests.swift
//  Desafio AGSoft iOSTests
//
//  Created by Renan Alves on 06/02/19.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import XCTest
@testable import GoogleMobileVision
@testable import ImageDetect
@testable import Pods_Desafio_AGSoft_iOS

class Desafio_AGSoft_iOSTests: XCTestCase {

    
    func testExtractFaceImage() {
        let image = UIImage(named: "Corbin Pritza - Foto.jpg")!
        
        image.detector.crop(type: .face) { (result) in
            switch result {
            case .success:
                XCTAssert(true, "Conseguiu cortar a face.")
            case .notFound:
                XCTFail("Face nÃo encontrada.")
            case .failure:
                XCTFail("Erro durante o corte da face ")
            }
        }
    }
    
}
