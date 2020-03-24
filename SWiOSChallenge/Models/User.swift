//
//  User.swift
//  SWiOSChallenge
//
//  Created by Bernan Cordero on 3/23/20.
//  Copyright © 2020 Bernan. All rights reserved.
//

import Foundation

struct User: Codable {
    let results: [UserResult]

    enum CodingKeys: String, CodingKey {
        case results
        case info
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decode([UserResult].self, forKey: .results)
    }

    func encode(to encoder: Encoder) throws {
    }
}

struct UserResult: Codable {
    let phone: String
    let name: UserName
    let location: UserLocation
    let picture: UserPicture

    enum CodingKeys: String, CodingKey {
        case phone
        case name
        case location
        case picture
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        phone = try container.decode(String.self, forKey: .phone)
        name = try container.decode(UserName.self, forKey: .name)
        location = try container.decode(UserLocation.self, forKey: .location)
        picture = try container.decode(UserPicture.self, forKey: .picture)
    }
}

struct UserName: Codable {
    let title: String
    let first: String
    let last: String

    enum CodingKeys: String, CodingKey {
        case title
        case first
        case last
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        first = try container.decode(String.self, forKey: .first)
        last = try container.decode(String.self, forKey: .last)
    }
}

struct UserPicture: Codable {
    let large: String
    let medium: String
    let thumbnail: String

    enum CodingKeys: String, CodingKey {
        case large
        case medium
        case thumbnail
    }

    init(decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        large = try container.decode(String.self, forKey: .large)
        medium = try container.decode(String.self, forKey: .medium)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
    }
}

struct UserLocation: Codable {
    let city: String
    let state: String
    let country: String
    let street: UserLocationStreet

    enum CodingKeys: String, CodingKey {
        case city
        case state
        case country
        case street
    }

    init(decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        country = try container.decode(String.self, forKey: .country)
        street = try container.decode(UserLocationStreet.self, forKey: .street)
    }
}

struct UserLocationStreet: Codable {
    let number: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case number
        case name
    }

    init(decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        number = try container.decode(Int.self, forKey: .number)
        name = try container.decode(String.self, forKey: .name)
    }
}
