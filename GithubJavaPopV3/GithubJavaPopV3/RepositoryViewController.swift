//
//  ViewController.swift
//  GithubJavaPopV3
//
//  Created by Suh on 04/07/22.
//

// swiftlint:disable line_length

import UIKit

protocol RepositoryViewControllerDelegate: AnyObject {
    func showPullRequest(repository: String, owner: String)
}

class RepositoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewLoading: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    var model: RepositoryModel?
    var repositories: [Repository] {
        model?.repositories ?? []
    }

    weak var delegate: RepositoryViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetch()
    }

    private func fetch() {
        self.showLoading()
        self.model?.fetchRepositories()
    }

    private func showLoading() {
        self.loadingIndicator.startAnimating()
        self.viewLoading.isHidden = false
        view.bringSubviewToFront(viewLoading)
    }

    private func hideLoading() {
        self.loadingIndicator.stopAnimating()
        self.viewLoading.isHidden = true
        view.sendSubviewToBack(viewLoading)
    }

}

extension RepositoryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RepositoryTableViewCell else {
            fatalError()
        }
        let repository = repositories[indexPath.row]
        cell.prepare(model: repository)
        return cell
    }
}

extension RepositoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repository = repositories[indexPath.row]
        delegate?.showPullRequest(repository: repository.name, owner: repository.ownerLogin)

    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if repositories.count - 1 == indexPath.row {
            self.fetch()
        }
    }

}

extension RepositoryViewController: RepositoryModelDelegate {
    func didUpdateRepositories() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.hideLoading()
        }

    }

    func didErrorRepositories() {
        print("Error!!")
        DispatchQueue.main.async { [weak self] in
            self?.hideLoading()
        }
    }
}
