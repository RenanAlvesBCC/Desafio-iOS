//
//  TableViewDataSource.swift
//  Desafio AGSoft iOS
//
//  Created by Renan Alves on 05/02/19.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
    
    var datas = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegisterAliensCell", for: indexPath)
        
        if let cell = cell as? AliensTableViewCell {
            cell.lblNames.text = datas[indexPath.row]
            cell.imgAliens.image = Alienigena.init(name: datas[indexPath.row]).image
        }else if let cell = cell as? RegisterAliensTableViewCell {
            cell.nomeAliens.text = datas[indexPath.row]
        }
        return cell
    }
}
