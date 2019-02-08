//
//  K.swift
//  Desafio AGSoft iOS
//
//  Created by Renan Alves on 05/02/19.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import UIKit

struct K {
    static var names = ["Prugue Seska", "Brellar Mara", "Hoggue Goro", "Aabran Benia", "Pretav Zara", "Shoggue Rejar", "Brony Maro Brony Parnia", "Tekor Damar", "Corbin Daro", "Siloc Tajor", "Aarmar Mosolmak Daro", "Kamem Seska", "Kovor Rusol", "Aaral Telle", "Crugue Mavok", "Corbin Pritza", "Meken Gara", "Kamad Daro", "Jori Trale", "Cretav Tania", "Anpat Padal", "Gavr", "Gaar", "Silon Pora", "Thavand sh'Share", "Odas sh'Zula", "Thanthaa zh'Rada", "Shrani sh'Vranthi", "Thrib zh'Shendria"]
}

struct Controller {
    
    static func createController(storyBoardName: String,controllerIdentifier: String) -> UIViewController {
        let storyBoard = UIStoryboard(name: storyBoardName, bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: controllerIdentifier)
        return controller
    }
}

struct Files {
    static let NameFileAlienRegister = "AliensForRegister"
    static let extensionFile = "json"
}
