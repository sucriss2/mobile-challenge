//
//  REST.swift
//  GithubJavaPop
//
//  Created by Suh on 31/05/22.
//

import Foundation
import UIKit

struct REST {
   
    private static let basePath = "https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30.0
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    static func loadRepository(onComplete: @escaping (RepositoryResponse) -> Void) {
        guard let url = URL(string: basePath) else { return }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {

                guard let response = response as? HTTPURLResponse else {return}
                if response.statusCode == 200 {

                    guard let data = data else {return}
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let repository = try decoder.decode(RepositoryResponse.self, from: data)
                        onComplete(repository)
                    } catch {
                        print(error.localizedDescription)
                    }

                } else {
                    print("Algum status inválido pelo servidor!!")
                }

            } else {
                print(error!)
            }
            
        }
        dataTask.resume()
    }
    
    
    
//    static func fetchRepository(onComplete: @escaping ([Repository]?) -> Void) {
//        if let url = URL(string: "https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1") {
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                if let data = data {
//                    do{
//                        let res = try JSONDecoder().decode([Repository].self, from: data)
//                        print("res: \(res)")
//                        onComplete(res)
//
//                    } catch let error {
//                        print(error.localizedDescription)
//                        onComplete(nil)
//                    }
//                }
//            }
//            .resume()
//        }
//    }
//}
//REST.fetchRepository { data in
//    guard let r
}
