//
//  ViewController.swift
//  Desafio AGSoft iOS
//
//  Created by Yago Teixeira on 05/02/2019.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aliensTableView: UITableView!
    private let dataSource = TableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        aliensTableView.dataSource = dataSource
        aliensTableView.delegate = self
        self.dataSource.datas = K.nomes
        aliensTableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
