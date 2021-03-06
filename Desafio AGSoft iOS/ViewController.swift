//
//  ViewController.swift
//  Desafio AGSoft iOS
//
//  Created by Yago Teixeira on 05/02/2019.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import UIKit

class InicialViewController: UIViewController {

    @IBOutlet weak var aliensTableView: UITableView!
    private let dataSource = TableViewDataSource()
    var aliensCadastrados = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        aliensTableView.dataSource = dataSource
        aliensTableView.delegate = self
        self.dataSource.datas = aliensCadastrados
        aliensTableView.reloadData()
    }
}

//MARK: - Delegate da tableView

extension InicialViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let sb = UIStoryboard(name: "PassaporteAlien", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "AlienDetail") as? PassaporteAlien
        
            vc?.alien = Alienigena.init(name: aliensCadastrados[indexPath.row])
            if let descViewController = vc {
                if let nc = self.navigationController {
                    nc.pushViewController(descViewController, animated: true)
                }
            }
    }
    
}

//MARK: - NavigationController

extension InicialViewController {
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
        print("Estatisticas.")
    }
    
    @objc func adicionarAlien() {
        let sb = UIStoryboard(name: "AdicionaAlien", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "AdicionaAliens") as? AdicionaAliens
        
        if let adcAlienViewController = vc {
            if let vc = self.navigationController {
                vc.pushViewController(adcAlienViewController, animated: true)
            }
        }
    }
}
