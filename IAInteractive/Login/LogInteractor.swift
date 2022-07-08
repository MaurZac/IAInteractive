//
//  LogInteractor.swift
//  IAInteractive
//
//  Created by Mauricio Zarate on 06/07/22.
//  
//

import Foundation

class LogInteractor: LogInteractorInputProtocol {
    

    // MARK: Properties
    weak var presenter: LogInteractorOutputProtocol?
    var localDatamanager: LogLocalDataManagerInputProtocol?
    var remoteDatamanager: LogRemoteDataManagerInputProtocol?
    
    var dataResponse = LogEntity(error_description: "")
    
    func getData() {
        remoteDatamanager?.startSesion()
    }
}

extension LogInteractor: LogRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func remoteDataManagerCallBackDta(with dattos: LogEntity) {
        dataResponse = dattos
        presenter?.interPassingDataPresenter(receivedData: dataResponse)
        
    }
}
