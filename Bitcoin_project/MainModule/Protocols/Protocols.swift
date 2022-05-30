//
//  Protocols.swift
//  Bitcoin_project
//
//  Created by Sinuhé Ruedas on 25/03/22.
//

import UIKit

//From View to Presenter
protocol MainModuleViewProtocol: AnyObject {
    var presenter: MainModulePresenterProtocol? { get set }
    func loadedView(data: [BTCRate])
}

// From Presenter to Interactor
protocol MainModuleInteractorInputProtocol: AnyObject {
    var presenter: MainModuleInteractorOutputProtocol? { get set }
    func willGetData()
}

// From Interactor to Presenter
protocol MainModuleInteractorOutputProtocol{
    func handleData(data: BTCData)
}

// From Presenter to View
protocol MainModulePresenterProtocol{
    func loadData()
}

// From Interactor to RemoteData
protocol MainModuleRemoteDataInputProtocol{
    var interactor: MainModuleRemoteDataOutputProtocol? { get set }
    // Function that fetches remote json data
    func fetchJsonData(for fileName: String, fileExtension: String)
}

// From RemoteData to Interactor
protocol MainModuleRemoteDataOutputProtocol{
    func getJson(data: Data)
}

// From Presenter to Router
protocol MainModuleRouterProtocol{
    func showMainModuleView()
}
