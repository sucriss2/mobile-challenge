//
//  description.swift
//  GithubJavaPop
//
//  Created by Suh on 24/05/22.
//

import Foundation

struct Repository: Codable {
    var name: String
    var description: String
    var stargazersCount: Int
    var forks: Int
    var owner: Owner
}

extension Repository {
    var ownerAvatarUrl: String {
        owner.avatarUrl
    }
    
    var ownerLogin: String {
        owner.login
    }
}

#if DEBUG
extension Repository {
    static func fixture(
        name: String = "Maria",
        description: String = "Ave Maria Cheia de graças O senhor é convosco Bendita sois vós Entre as mulheres E bendito é o fruto Do vosso ventre, Jesus.",
        stargazersCount: Int = 3524,
        forks: Int = 7355,
        owner: Owner = Owner.fixture()
    ) -> Repository {
        Repository(
            name: name,
            description: description,
            stargazersCount: stargazersCount,
            forks: forks,
            owner: owner
        )
    }
}
#endif

