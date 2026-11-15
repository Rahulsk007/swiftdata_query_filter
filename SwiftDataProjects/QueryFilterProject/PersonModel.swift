//
//  PersonModel.swift
//  SwiftDataProjects
//
//  Created by Sk Sahabuddin on 15/11/26.
//

import Foundation
import SwiftData

@Model
final class PersonModel {
    @Attribute(.unique) var id = UUID()
    var name : String
    var phone: String
    var email: String
    var address: String
    
    init(name: String, phone: String, email: String, address: String) {
        self.name = name
        self.phone = phone
        self.email = email
        self.address = address
    }
}
