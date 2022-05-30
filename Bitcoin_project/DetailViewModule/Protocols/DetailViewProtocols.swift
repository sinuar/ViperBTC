//
//  DetailViewProtocols.swift
//  Bitcoin_project
//
//  Created by Sinuhé Ruedas on 30/05/22.
//

import UIKit

//From View to Presenter
protocol DetailModuleViewProtocol: AnyObject {
    var presenter: DetailModulePresenterProtocol? { get set }
   
}

// From Presenter to Interactor
protocol DetailModuleInteractorInputProtocol: AnyObject {
    var presenter: DetailModuleInteractorOutputProtocol? { get set }
   
}

// From Interactor to Presenter
protocol DetailModuleInteractorOutputProtocol{
   
}

// From Presenter to View
protocol DetailModulePresenterProtocol{
   
}

// From Interactor to RemoteData
protocol DetailModuleRemoteDataInputProtocol{
    
}

// From RemoteData to Interactor
protocol DetailModuleRemoteDataOutputProtocol{
    
}

// From Presenter to Router
protocol DetailModuleRouterProtocol{
    func showDetailModuleView()
}
