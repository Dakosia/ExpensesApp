//
//  OperationType.swift
//  ExpensesApp
//
//  Created by Dakosia on 7/18/20.
//  Copyright © 2020 Dakosia. All rights reserved.
//

import Foundation

/// Operation type with refill and withdraw cases
enum OperationType: Int {
    case refill = 0
    case withdraw = 1
    
    var title: String {
        switch self {
        case .refill:
            return "Пополнение"
        case .withdraw:
            return "Снятие"
        }
    }
}
