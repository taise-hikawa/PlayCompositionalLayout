//
//  Int+Extensions.swift
//  PlayCompositionalLayout
//
//  Created by 樋川大聖 on 2022/03/23.
//

import Foundation

extension Int {
    var price: String {
        let formatter: NumberFormatter = {
            let f = NumberFormatter()
            f.numberStyle = .decimal
            f.groupingSeparator = ","
            f.groupingSize = 3
            return f
        }()
        return formatter.string(from: NSNumber(integerLiteral: self)) ?? "\(self)"
    }
}
