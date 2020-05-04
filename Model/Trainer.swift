//
//  Trainer.swift
//  ATC Now!
//
//  Created by Academia on 5/4/20.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

struct Trainer: Codable, Hashable {
    public var id: String
    public var firstName: String
    public var lastName: String
    public var title: String
    public var email: String
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case firstName = "FirstName"
        case lastName = "LastName"
        case title = "Title"
        case email = "Email"
    }
}
