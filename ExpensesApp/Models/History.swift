//
//  History.swift
//  ExpensesApp
//
//  Created by Dakosia on 7/18/20.
//  Copyright © 2020 Dakosia. All rights reserved.
//

import RealmSwift

class History: Object {
    @objc dynamic var amount: Double = 0.0
    @objc dynamic var currency: String = "KZT"
    @objc dynamic var operationType: Int = 0
    @objc dynamic var reason: String = ""
}
