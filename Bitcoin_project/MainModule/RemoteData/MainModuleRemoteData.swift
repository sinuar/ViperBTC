//
//  MainModuleRemoteData.swift
//  Bitcoin_project
//
//  Created by Sinuhé Ruedas on 25/03/22.
//

import Foundation

class MainModuleRemoteData {
    // From RemoteData to Interactor
    // MARK: - Protocol properties
    var interactor: MainModuleRemoteDataOutputProtocol?
}

// From Interactor to RemoteData
extension MainModuleRemoteData: MainModuleRemoteDataInputProtocol {
    func fetchJsonData(for fileName: String, fileExtension: String) {
        let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        do {
            let data = try Data(contentsOf: url!)
            print(data)
            interactor?.getJson(data: data)
        } catch {
            print ("error")
            
        }
    }
}
