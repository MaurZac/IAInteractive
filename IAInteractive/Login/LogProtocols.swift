//
//  LogProtocols.swift
//  IAInteractive
//
//  Created by Mauricio Zarate on 06/07/22.
//  
//

import Foundation
import UIKit

protocol LogViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: LogPresenterProtocol? { get set }
    func presenterPushDataView(received: LogEntity)
}

protocol LogWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createLogModule() -> UIViewController
    func presentNewView(from view: LogViewProtocol)
}

protocol LogPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: LogViewProtocol? { get set }
    var interactor: LogInteractorInputProtocol? { get set }
    var wireFrame: LogWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func getToken()
    func showNewView()
}

protocol LogInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interPassingDataPresenter(receivedData: LogEntity)
}

protocol LogInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: LogInteractorOutputProtocol? { get set }
    var localDatamanager: LogLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: LogRemoteDataManagerInputProtocol? { get set }
    
    func getData()
}

protocol LogDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol LogRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: LogRemoteDataManagerOutputProtocol? { get set }
    func startSesion()
}

protocol LogRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteDataManagerCallBackDta(with res: LogEntity)
}

protocol LogLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
