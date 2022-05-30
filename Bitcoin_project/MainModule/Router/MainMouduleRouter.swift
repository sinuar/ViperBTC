//
//  Router.swift
//  Bitcoin_project
//
//  Created by Sinuhé Ruedas on 25/03/22.
//
import UIKit

class MainModuleRouter {
    // Initialising properties
    // From Presenter to Router
    
    var view: MainModuleView
    var interactor: MainModuleInteractor
    var presenter: MainModulePresenter
    var remoteData: MainModuleRemoteData
    var window: UIWindow
    
    init(window: UIWindow){
        self.window = window
        view = MainModuleView()
        interactor = MainModuleInteractor()
        presenter = MainModulePresenter()
        remoteData = MainModuleRemoteData()
        
        //Linking of instances
        view.presenter = self.presenter
        interactor.presenter = self.presenter
        interactor.remoteData = self.remoteData
        presenter.interactor = self.interactor
        presenter.router = self
        presenter.view = self.view
        remoteData.interactor = self.interactor
    }
}

extension MainModuleRouter: MainModuleRouterProtocol {
    
    func showMainModuleView() {
        window.rootViewController = UINavigationController(rootViewController: view)
        window.makeKeyAndVisible()
    }
}
