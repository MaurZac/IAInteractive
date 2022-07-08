//
//  LogPresenter.swift
//  IAInteractive
//
//  Created by Mauricio Zarate on 06/07/22.
//  
//

import Foundation

class LogPresenter  {
    
    // MARK: Properties
    weak var view: LogViewProtocol?
    var interactor: LogInteractorInputProtocol?
    var wireFrame: LogWireFrameProtocol?
    
}

extension LogPresenter: LogPresenterProtocol {
    
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        
    }
    
    func getToken(){
        interactor?.getData()
    }
    
    
    func showNewView() {
        wireFrame?.presentNewView(from: view!)
    }
}

extension LogPresenter: LogInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func interPassingDataPresenter(receivedData: LogEntity){
        view?.presenterPushDataView(received: receivedData)
    }
}
