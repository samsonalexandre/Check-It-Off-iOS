//
//  User.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 07.02.24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
