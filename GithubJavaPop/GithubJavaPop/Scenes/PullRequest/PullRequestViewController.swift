//
//  RepositoriosViewController.swift
//  GithubJavaPop
//
//  Created by Suh on 23/05/22.
//

import UIKit
import SafariServices

class PullRequestViewController: UIViewController {

    @IBOutlet weak var tableViewPullRequest: UITableView!
    
    static let identifier = "PullRequestViewController"
    
    private var pullRequest: [PullRequest] = []
    var ownerName: String = ""
    var repositoryName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("\(ownerName), \(repositoryName)")
        //pullRequest = mockPullRequest()
        tableViewPullRequest.delegate = self
        tableViewPullRequest.dataSource = self
        
        REST.fetchPullRequest(owner: ownerName, repository: repositoryName) { (pullRequest) in
            DispatchQueue.main.async { [weak self] in
                self?.pullRequest = pullRequest
                self?.tableViewPullRequest.reloadData()
            }
        }
    }

}

extension PullRequestViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellPull", for: indexPath) as? PullRequestTableViewCell else {
            fatalError()
        }
        let pulls = pullRequest[indexPath.row]
        
        cell.selectionStyle = .none
        cell.prepare(model: pulls)
        return cell
    }
}

extension PullRequestViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let URL = URL(string: pullRequest[indexPath.row].htmlUrl) else {
            return
        }
        
        let pullRequestViewController = SFSafariViewController(url: URL)
        navigationController?.pushViewController(pullRequestViewController, animated: true)
        print(pullRequest[indexPath.row].htmlUrl)
    }
}

//private func mockPullRequest() -> [PullRequest] {
//    return [
//        .fixture(),
//        .fixture(title: "skhfauhkbf", body: "kjshvhawoiyrowqgfoa", createdAt: "bsjgfuiss", user: Owner.fixture()) ]
//}


