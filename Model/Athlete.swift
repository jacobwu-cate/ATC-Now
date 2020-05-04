//
//  Athlete.swift
//  ATC Now!
//
//  Created by Academia on 5/4/20.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

struct Athlete: Codable, Hashable {
    public var id: String
    public var firstName: String
    public var lastName: String
    public var sport: String
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case firstName = "FirstName"
        case lastName = "LastName"
        case sport = "Sport"
    }
}

// var exercisePlan: Int
// var appointments: [Appointment]

// Calendar option? How to track appointment

