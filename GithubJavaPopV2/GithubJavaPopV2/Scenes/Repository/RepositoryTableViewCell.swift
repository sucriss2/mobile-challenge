//
//  RepositoryTableViewCell.swift
//  GithubJavaPopV2
//
//  Created by Suh on 09/06/22.
//

import UIKit
import Kingfisher

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var folksLabel: UILabel!
    @IBOutlet weak var stargazersLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var placeholder = UIImage(named: "placeholder.png")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func prepare(model: Repository) {
        nameLabel?.text = model.name
        descriptionLabel?.text = model.description
        folksLabel?.text = String(model.forks)
        stargazersLabel?.text = String(model.stargazersCount)
        userNameLabel?.text = model.ownerLogin
        let url = URL(string: model.ownerAvatarUrl)
        self.avatarImageView.kf.setImage(with: url, placeholder: placeholder)
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height/2
    }
}
