//
//  Destination.swift
//  ITour
//
//  Created by Bekir Berke Yılmaz on 2.10.2023.
//

import Foundation
import SwiftData

@Model
class Destination{
    var name: String
    var details: String
    var date : Date
    var priority: Int
    @Relationship(deleteRule: .cascade) var sights = [Sight]()
    init(name: String, details: String, date: Date, priority: Int) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
