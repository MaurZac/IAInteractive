//
//  LogWireFrame.swift
//  IAInteractive
//
//  Created by Mauricio Zarate on 06/07/22.
//  
//

import Foundation
import UIKit

class LogWireFrame: LogWireFrameProtocol {

    class func createLogModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "LogView")
        if let view = navController as? LogView {
            let presenter: LogPresenterProtocol & LogInteractorOutputProtocol = LogPresenter()
            let interactor: LogInteractorInputProtocol & LogRemoteDataManagerOutputProtocol = LogInteractor()
            let localDataManager: LogLocalDataManagerInputProtocol = LogLocalDataManager()
            let remoteDataManager: LogRemoteDataManagerInputProtocol = LogRemoteDataManager()
            let wireFrame: LogWireFrameProtocol = LogWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "LogView", bundle: Bundle.main)
    }
    
    func presentNewView(from view: LogViewProtocol) {
        let newDetailView = HomeWireFrame.createHomeModule()
        newDetailView.modalPresentationStyle = .fullScreen
        newDetailView.modalTransitionStyle = .crossDissolve
        if let newView =  view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
}
