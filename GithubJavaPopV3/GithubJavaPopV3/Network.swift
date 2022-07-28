//
//  Network.swift
//  GithubJavaPopV3
//
//  Created by Suh on 08/07/22.
//

import Foundation

class Network {
    
    private let session: URLSession
    static var shared: Network {
        if instance == nil {
            instance = Network()
        }
        return instance!
    }
    
    static private var instance: Network?
    //Alternative
    //static let shared = Network()
    
    private init() {
        session = URLSession.shared
    }
    
    func requestData(
        using request: RequestProtocol,
        onComplete: @escaping (Result<Data, Error>) -> Void
        //onError: @escaping (Error) -> Void
    ) {
        guard let url = URL(string: request.baseURL + request.path) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        let datatask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                onComplete(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                let error = NSError(domain: "Response fail", code: 499, userInfo: nil)
                onComplete(.failure(error))
                return
            }
            
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                let error = NSError(domain: "Unexpected fail", code: response.statusCode, userInfo: nil)
                onComplete(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "No Data", code: 499, userInfo: nil)
                onComplete(.failure(error))
                return
            }
            
            onComplete(.success(data))
            
        }
        datatask.resume()
    }

}
