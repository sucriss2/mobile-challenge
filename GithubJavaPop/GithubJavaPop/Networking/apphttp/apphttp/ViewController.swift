//
//  ViewController.swift
//  apphttp
//
//  Created by Suh on 01/06/22.
//

import UIKit


struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest { (posts) in
            //print("posts: \(posts[0].title)")
            print("posts: \(posts[0])")
        }

    }
    

    private func makeRequest(completion: @escaping ([Post]) -> ()) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
//            print("response: \(String(describing: response))")
//            print("error: \(String(describing: error))")
            
            guard let responseData = data else { return }
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: responseData)
                //print("objects posts: \(posts)")
                completion(posts)
                
            } catch let error {
                print("error: \(error)")
            }
            
//            if let responseString = String(data: responseData, encoding: .utf8) {
//                print(responseString)
//            }
        }
        task.resume()
    }

}
