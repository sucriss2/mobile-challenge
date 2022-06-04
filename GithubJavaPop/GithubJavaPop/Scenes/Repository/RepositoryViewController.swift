//
//  ViewController.swift
//  GithubJavaPop
//
//  Created by Suh on 23/05/22.
//

import UIKit

class RepositoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var repositories: [Repository] = []
    
    override func viewDidLoad() {
         super.viewDidLoad()
        //repositories = mockRepositories()
        tableView.dataSource = self
        REST.loadRepository {  (repositories) in
            
            DispatchQueue.main.async { [weak self] in
                self?.repositories = repositories.items
                self?.tableView.reloadData()
            }
        }
        
    }
    
 
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! WorldCupViewController
//        let worldCup = worldCups[tableView.indexPathForSelectedRow!.row]
//        vc.worldCup = worldCup
//    }
    
    
    @IBAction func showPullRequest(_ sender: UIBarButtonItem) {
        let pullRequestStoryboard = UIStoryboard.init(name: "PullRequestStoryboard", bundle: nil)
        guard let pullRequestViewController = pullRequestStoryboard.instantiateViewController(withIdentifier: PullRequestViewController.identifier) as? PullRequestViewController else {
            fatalError()
        }
        present(pullRequestViewController, animated: true, completion: nil)
    }
    
}

extension RepositoryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(repositories.count)
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RepositoryTableViewCell else {
            fatalError()
        }
        let repositories = repositories[indexPath.row]
        cell.prepare(model: repositories)
        return cell
    }
    
    
}

//extension RepositoryViewController: PullRequestViewControllerDelegate {
//    func showPr(pull: [PullRequest]) {
//        print(pull)
//    }
//    
//    
//}

//private func mockRepositories() -> [Repository] {
//    return [
//        .fixture(),
//        .fixture(),
//        .fixture(name: "Joao", description: "Pai Nosso que estais no céu, santificado seja o vosso nome, vem a nós o vosso reino, seja feita a vossa vontade assim na terra como no céu. O pão nosso de cada dia nos daí hoje, perdoai-nos as nossas ofensas, assim como nós perdoamos a quem nos tem ofendido, não nos deixei cair em tentação mas livrai-nos do mal. Amém.", stargazersCount: 23, forks: 45, owner: Owner.fixture()),
//        .fixture(),
//        .fixture(),
//        .fixture(),
//        .fixture()
//    ]
//}
