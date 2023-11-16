//
//  College.swift
//  CPB_Firebase
//
//  Created by Jia Jakubiec on 11/6/23.
//

import Foundation
import SwiftData
import FirebaseDatabaseSwift
import FirebaseDatabase

@Model
class College {
    var name:String
    var location:String
    var student:String
    var url:String
    init(name: String,location:String,student:String,url:String) {
        self.name = name
        self.location = location
        self.student = student
        self.url = url
    }
}
