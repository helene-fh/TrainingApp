//
//  ClubModel.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-16.
//

import Foundation

struct ClubResponse: Decodable {
    var id: Int
    var name: String
    var address: AddressModel
}

struct ClubModel: Decodable, Identifiable {
    var id: Int
    var name: String
    var address: AddressModel
}

struct AddressModel: Decodable {
    var postalCode: String
    var city: String
    var street: String
}
