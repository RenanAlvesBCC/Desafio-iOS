//
//  ViewController.swift
//  Desafio AGSoft iOS
//
//  Created by Yago Teixeira on 05/02/2019.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var aliensTableView: UITableView!
    private let dataSource = TableViewDataSource()
    var aliensCadastrados = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        aliensTableView.backgroundColor = UIColor(named: "Dark Blue")
        setupNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        aliensTableView.dataSource = dataSource
        aliensTableView.delegate = self
        if aliensCadastrados.isEmpty {
            if let view = self.view.viewWithTag(0) {
                self.view.bringSubviewToFront(view)
            }
        }else {
            self.view.bringSubviewToFront(aliensTableView)
        }
        self.dataSource.datas = aliensCadastrados
        aliensTableView.reloadData()
    }
}

//MARK: - Delegate da tableView

extension InitialViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let sb = UIStoryboard(name: "PassaporteAlien", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "AlienDetail") as? PassporteAlien
        
            vc?.alien = Alienigena.init(name: aliensCadastrados[indexPath.row])
            if let descViewController = vc {
                if let nc = self.navigationController {
                    nc.pushViewController(descViewController, animated: true)
                }
            }
    }
    
}

//MARK: - NavigationController

extension InitialViewController {
    private func setupNavigation() {
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "Dark Blue")
        self.navigationItem.title = "Aliens"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor(named: "Yellow")]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
        
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(adicionarAlien))
        let infoButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.bookmarks, target: self, action: #selector(estatisticaPassaportes))
        
        infoButton.tintColor = UIColor(named: "Yellow")
        addButton.tintColor = UIColor(named: "Yellow")
        
        self.navigationItem.leftBarButtonItem = infoButton
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func estatisticaPassaportes() {
        
        let sb = UIStoryboard(name: "Estatistics", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Estatistics") as? EstatisticsViewController
        if let adcAlienViewController = vc {
            if let nc = self.navigationController {
                vc?.namesAliens = self.aliensCadastrados
                nc.pushViewController(adcAlienViewController, animated: true)
            }
        }
        
    }
    
    @objc func adicionarAlien() {
        let sb = UIStoryboard(name: "RegisterAliens", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RegisterAliens") as? RegisterAliens
        vc?.delegate = self
        if let adcAlienViewController = vc {
            if let nc = self.navigationController {
                nc.pushViewController(adcAlienViewController, animated: true)
            }
        }
    }
}
//MARK: - Delegate
extension InitialViewController: RegisterPassportAlien {
    func register(alien: Alienigena) {
        aliensCadastrados.append(alien.name)
    }
}
