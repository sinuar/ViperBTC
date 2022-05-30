//
//  MainModulePresenter.swift
//  Bitcoin_project
//
//  Created by Sinuhé Ruedas on 25/03/22.
//

import Foundation


class MainModulePresenter {
    // MARK: - Protocol properties
    
    //From View to Presenter
    weak var view: MainModuleViewProtocol?
    
    //From Presenter to Interactor
    weak var interactor: MainModuleInteractorInputProtocol?
    
    //From Presenter to Router
    var router: MainModuleRouterProtocol?
}

// From Interactor to Presenter
extension MainModulePresenter: MainModulePresenterProtocol {
    func viewDidLoad() {
        // Presenter to Interactor
    }
    
    func loadData() {
        interactor?.willGetData()
    }
}

// From Presenter to View
extension MainModulePresenter: MainModuleInteractorOutputProtocol {
    func handleData(data: BTCData) {
        var btcRates: [BTCRate] = []
        let sortedRates = data.rates?.sorted(by: <)
        guard let rates = sortedRates else { return }
        
        for rate in rates {
            btcRates.append(BTCRate(cripto: rate.key, parity: rate.value))
        }
        
        view?.loadedView(data: btcRates)
    }
    
}
