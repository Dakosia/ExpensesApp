//
//  User.swift
//  ExpensesApp
//
//  Created by Dakosia on 7/18/20.
//  Copyright © 2020 Dakosia. All rights reserved.
//

import RealmSwift

class User: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var totalAmount: Double = 0.0
    @objc dynamic var currency: String = ""
}
