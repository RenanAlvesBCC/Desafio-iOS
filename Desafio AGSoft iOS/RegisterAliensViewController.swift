//
//  AdiconaAliens.swift
//  Desafio AGSoft iOS
//
//  Created by Renan Alves on 07/02/19.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import UIKit

class RegisterAliens: UIViewController {
    
    
    @IBOutlet weak var aliensTableView: UITableView!
    var dataSource = TableViewDataSource()
    var aliensToRegister = [String]()
    var delegate: RegisterPassportAlien?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.aliensTableView.backgroundColor = UIColor(named: "Dark Blue")
        setupNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        aliensTableView.delegate = self
        aliensTableView.dataSource = self.dataSource
        AliensForRegisterDAO.shared.loadAliens()
        self.aliensToRegister = AliensForRegisterDAO.shared.names
        self.dataSource.datas = aliensToRegister
        aliensTableView.reloadData()
    }
    
    private func setupNavigationController() {
        
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "Dark Blue")
        self.navigationItem.title = "para criar passaporte"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor(named: "Yellow")]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
        
    }
    
}

extension RegisterAliens: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "ConfirmRegister", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "confirmAlien") as? ConfirmRegisterAlienViewController
        
        if let vc = vc {
            let alien = Alienigena.init(name: aliensToRegister[indexPath.row])
            vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            vc.alien = alien
            
            if let topController = UIApplication.shared.keyWindow?.rootViewController {
                topController.present(vc, animated: false, completion: nil)
            }
            vc.onDoneBlock = { result in
                if result == true {
                    self.delegate?.register(alien: alien)
                    self.aliensToRegister.remove(at: indexPath.row)
                    AliensForRegisterDAO.shared.save(namesAliens: self.aliensToRegister)
                    self.dataSource.datas = self.aliensToRegister
                    self.aliensTableView.reloadData()
                }
            }
        }
    }
}


