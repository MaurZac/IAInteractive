//
//  LogRemoteDataManager.swift
//  IAInteractive
//
//  Created by Mauricio Zarate on 06/07/22.
//  
//

import Foundation

class LogRemoteDataManager:LogRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: LogRemoteDataManagerOutputProtocol?
    
    func startSesion(){
       let Url = String(format: "https://stage-api.cinepolis.com/v2/oauth/token")
        guard let serviceUrl = URL(string: Url) else { return }
            let parameters: [String: Any] = [
                "request": [
                        "country_code" : "MX",
                        "username": "mauricio",
                        "password": "1234",
                        "grant_type": "password",
                        "client_id": "IATestCandidate",
                        "client_secret": "c840457e777b4fee9b510fbcd4985b68"
                ]
            ]
            var request = URLRequest(url: serviceUrl)
            request.httpMethod = "POST"
            //request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("api_key", forHTTPHeaderField: "stage_HNYh3RaK_Test")
            //request.setValue("Cache-Control", forHTTPHeaderField: "no-cache")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                return
            }
            request.httpBody = httpBody
            request.timeoutInterval = 20
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                //if let response = response {
                    //print(response)
                
                //}
                if let data = data {
                        if let res = try? JSONDecoder().decode(LogEntity.self, from: data) {
                            print(res)
                            self.remoteRequestHandler?.remoteDataManagerCallBackDta(with: res)
                        } else {
                            print("Invalid Response")
                        }
                }
            }.resume()
        }
    
    
}
