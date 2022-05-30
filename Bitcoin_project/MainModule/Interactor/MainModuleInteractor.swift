//
//  MainModuleInteractor.swift
//  Bitcoin_project
//
//  Created by Sinuhé Ruedas on 25/03/22.
//

import UIKit

class MainModuleInteractor {
    // From Interactor to Presenter
    var presenter: MainModuleInteractorOutputProtocol?
    
    // From Interactor to RemoteData
    var remoteData: MainModuleRemoteDataInputProtocol?
}

// From Presenter to Interactor
extension MainModuleInteractor: MainModuleInteractorInputProtocol {
    func willGetData() {
        remoteData?.fetchJsonData(for: "response", fileExtension: "json")
    }
}

// From RemoteData to Interactor
extension MainModuleInteractor: MainModuleRemoteDataOutputProtocol {
    func getJson(data: Data) {
        var responses: BTCData = BTCData()
        let decoder = JSONDecoder()
        if let jsonResponses = try? decoder.decode(DataModel.self, from: data) {
            responses = jsonResponses.data

        } else {
            print("Parsing Error")
        }
        // From Interactor to Presenter
        presenter?.handleData(data: responses)
    }
}


