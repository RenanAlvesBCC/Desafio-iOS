//
//  AliensParaCadastroDAO.swift
//  Desafio AGSoft iOS
//
//  Created by Renan Alves on 07/02/19.
//  Copyright © 2019 AGSoft. All rights reserved.
//

import Foundation
class AliensForRegisterDAO {
    static let shared = AliensForRegisterDAO()
    var names = [String]()
    let fileManager = FileManager.default

    /// Metodo para salvar nomes dos Aliens que faltam cadastrar.
    ///
    /// - Parameter nomesAliens: nomes dos aliens disponivel para cadastro.
    func save(namesAliens: [String]) {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            do {
                let alienFileURL = try self.createDiretorioAlien().appendingPathComponent(Files.NameFileAlienRegister).appendingPathExtension(Files.extensionFile)
                let encoder = JSONEncoder()
                let data = try encoder.encode(namesAliens)
                self.fileManager.createFile(atPath: alienFileURL.path, contents: data, attributes: [:])
            }catch {
                print("Erro durante o salvamento do arquivo do alienigena")
            }
        }
    }
    
    /// Metodo para ler todos os aliens que ainda falta para cadastro.
    ///
    /// - Returns: lista de Aliens para cadastro.
    func loadAliens() {
        let decoder = JSONDecoder()
        dispatchPrecondition(condition: .onQueue(.main))
        do {
            let url = try createDiretorioAlien().appendingPathComponent(Files.NameFileAlienRegister).appendingPathExtension(Files.extensionFile)
            guard fileManager.fileExists(atPath: url.path) else { return }
            let jsonData = try Data(contentsOf: url, options: Data.ReadingOptions.dataReadingMapped)
            self.names = try decoder.decode([String].self, from: jsonData)
        }catch {
            print("Erro durante o carregamento dos alienigenas para cadastrar passaporte.")
        }
    }
}
extension AliensForRegisterDAO {
    
    private func createDiretorioAlien() throws -> URL{
        let documents = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        return documents
    }
}
