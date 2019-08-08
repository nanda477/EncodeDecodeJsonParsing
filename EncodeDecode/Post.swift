//
//  Post.swift
//  EncodeDecode
//
//  Created by Ramanan D2V on 8/8/19.
//  Copyright © 2019 D2V Software Solutions pvt ltd. All rights reserved.
//

import Foundation
//["userID": "235","id": "2","name": "iOS Developer", "brand": "Apple", "device": "iPhone", "version": "iOS 13.0"]
struct Post: Encodable, Decodable {
    
    let body: String
    let id: Int
    let title: String
    let userId: Int    
}

struct Get: Encodable, Decodable {
    
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Address: Encodable, Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Location
}

struct Location: Encodable, Decodable {
    let lat: String
    let lng: String
}

struct Company: Encodable, Decodable {
    let name: String
    let catchPhrase: String
    let bs: String
}


