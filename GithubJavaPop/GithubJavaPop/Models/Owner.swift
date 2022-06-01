//
//  Owner.swift
//  GithubJavaPop
//
//  Created by Suh on 25/05/22.
//

import Foundation
import UIKit

struct Owner: Codable {
    var avatarUrl: String
    var login: String
}

#if DEBUG
extension Owner {
    static func fixture(
        avatarUrl: String = "https://avatars.githubusercontent.com/u/20487725?v=4",
        login: String = "MariaJ3"
    ) -> Owner {
        Owner(
            avatarUrl: avatarUrl,
            login: login
        )
    }
}
#endif

