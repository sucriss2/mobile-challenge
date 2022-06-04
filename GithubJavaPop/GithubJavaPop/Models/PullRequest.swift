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
}

extension PullRequest {
    var userLogin: String {
        user.login
    }
    var userAvatarUrl: String {
        user.avatarUrl
    }
}

extension PullRequest {
    static func fixture(
        title: String = "Htinhadoblog",
        body: String? = nil,
        createdAt: String = "20/03/2022 at 10:54pm",
        user: Owner = Owner.fixture()
    ) -> PullRequest {
        PullRequest(title: title,
                    body: body,
                    createdAt: createdAt,
                    user: user
            )
        
    }
}
    
//        name: String = "Maria",
//        description: String = "Ave Maria Cheia de graças O senhor é convosco Bendita sois vós Entre as mulheres E bendito é o fruto Do vosso ventre, Jesus.",
//        stargazersCount: Int = 3524,
//        forks: Int = 7355,
//        owner: Owner = Owner.fixture()
//    ) -> Repository {
//        Repository(
//            name: name,
//            description: description,
//            stargazersCount: stargazersCount,
//            forks: forks,
//            owner: owner
//        )
//    }

