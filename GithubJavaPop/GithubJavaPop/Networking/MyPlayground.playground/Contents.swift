import UIKit
import PlaygroundSupport
import Foundation

var greeting = "Hello, playground"

struct REST {
    static func fetchRepository(onComplete: @escaping (Data?) -> Void) {
        if let url = URL(string: "https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1"){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do{
                        
                        print(data)
                        onComplete(data)
                        //let res = try JSONDecoder().decode([Repository].self, from: data)
                        
                        JSONDecoder().decode(, from: data)
                        //onComplete(res)
                    } catch let error {
                        print(error.localizedDescription)
                        onComplete(nil)
                    }
                }
            }.resume()
        }
        
        
    }
}


REST.fetchRepository { data in
    guard let data = data else {
        return
    }
    let str = String(decoding: data, as: UTF8.self)
    print(str)
}


PlaygroundPage.current.needsIndefiniteExecution = true
