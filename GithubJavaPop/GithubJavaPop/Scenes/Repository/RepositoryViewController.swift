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
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        REST.loadRepository { (repositories) in
//
//            self.repositories = repositories
//            self.tableView.reloadData()
//        }
//    }

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
