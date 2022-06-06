//
//  PullRequestTableViewCell.swift
//  GithubJavaPop
//
//  Created by Suh on 02/06/22.
//

import UIKit

class PullRequestTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var avatarUserImageView: UIImageView!
    @IBOutlet weak var loginUserLabel: UILabel!
    @IBOutlet weak var createdPullLabel: UILabel!
       
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func prepare(model: PullRequest) {
        titleLabel.text = model.title
        bodyLabel.text = model.body
        let url = URL(string: model.userAvatarUrl)
        avatarUserImageView.kf.setImage(with: url)
        loginUserLabel.text = model.userLogin
        createdPullLabel.text = model.createdAt
        
    }
    
}
