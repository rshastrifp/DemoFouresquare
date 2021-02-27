//
//  APIClient.swift
//  demoProj
//
//  Created by Ronak Shahstri on 2021-02-27.
//

import Foundation
import Alamofire

typealias SuccessData = (_ data: Data) -> Void
typealias Failure = (_ error: Any) -> Void

class ApiClient {
    
    //I may like to use RXSwift instead of completion handler. But used Completion handeler for demo purpose.
    public func execute(api: FoursquareApi, params: [String: String], success: @escaping SuccessData, failure: @escaping Failure) {
        
        guard let url = URL(string: api.uri) else { return }
        
//        //Almofire can also be used for more advanced functions.
//        URLSession.shared.dataTask(with: url) { (data, response, err) in
//            guard let dataPrm = data else { return }
//            success(dataPrm)
//        }.resume()
        
        
        var urlComp = URLComponents(string: api.uri)!
        var items = [URLQueryItem]()
        for (key,value) in params {
            items.append(URLQueryItem(name: key, value: value))
        }
        items = items.filter{!$0.name.isEmpty}
        if !items.isEmpty {
            urlComp.queryItems = items
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse, error == nil else {
                print("Not a valid Response.")
                return
            }
            
            guard 200 ..< 300 ~= httpResponse.statusCode else {
                print("Status code was \(httpResponse.statusCode), but expected 2xx")
                failure(httpResponse.statusCode)
                return
            }
            
            success(data)
        }).resume()
    }
    
    
}