//
//  PullRequest.swift
//  GithubJavaPop
//
//  Created by Suh on 02/06/22.
//

import Foundation

struct PullRequest: Codable {
    let title: String
    let body: String?
    let createdAt: String
    let user: Owner
    let htmlUrl: String
}

extension PullRequest {
    var userLogin: String {
        user.login
    }
    var userAvatarUrl: String {
        user.avatarUrl
    }
}

#if DEBUG
extension PullRequest {
    static func fixture(
        title: String = "Htinhadoblog",
        body: String? = nil,
        createdAt: String = "20/03/2022 at 10:54pm",
        user: Owner = Owner.fixture(),
        htmlUrl: String = ""
    ) -> PullRequest {
        PullRequest(title: title,
                    body: body,
                    createdAt: createdAt,
                    user: user,
                    htmlUrl: htmlUrl
            )
    }
}
#endif
