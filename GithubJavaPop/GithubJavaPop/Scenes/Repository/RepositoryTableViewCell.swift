//
//  ListTableViewCell.swift
//  GithubJavaPop
//
//  Created by Suh on 24/05/22.
//

import UIKit
import Kingfisher

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func prepare(model: Repository) {
        nameLabel.text = model.name
        detailsLabel.text = model.description
        starsLabel.text = String(model.stargazersCount)
        forksLabel.text = String(model.forks)
        let url = URL(string: model.ownerAvatarUrl)
        avatarImageView.kf.setImage(with: url)
        usernameLabel.text = model.ownerLogin
    }
    
}
