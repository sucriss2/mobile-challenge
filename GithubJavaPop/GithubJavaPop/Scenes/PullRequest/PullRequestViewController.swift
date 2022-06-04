//
//  RepositoriosViewController.swift
//  GithubJavaPop
//
//  Created by Suh on 23/05/22.
//

import UIKit

//protocol PullRequestViewControllerDelegate: AnyObject {
//    func showPr(pull: [PullRequest])
//}

class PullRequestViewController: UIViewController {

    @IBOutlet weak var tableViewPullRequest: UITableView!
    
    static let identifier = "PullRequestViewController"
    
    var pullRequest: [PullRequest] = []
   // weak var delegate: PullRequestViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableViewPullRequest.reloadData()
        pullRequest = mockPullRequest()
        tableViewPullRequest.dataSource = self

        // Do any additional setup after loading the view.
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
        cell.prepare(model: pulls)
        return cell
    }
        
    
}

private func mockPullRequest() -> [PullRequest] {
    return [
        .fixture(),
        .fixture(title: "skhfauhkbf", body: "kjshhsdrbalgfuabkjsfgkalgslfjhbaslgfigwoqoufoitruioghbtgdvuc gbbfnsdvpyhrgjs v vhawoiyrowqgfougabsfhovihqefha", createdAt: "bsjgfuiss", user: Owner.fixture()),
        .fixture(),
        .fixture(),
        .fixture(),
        .fixture()
    ]
    
}
