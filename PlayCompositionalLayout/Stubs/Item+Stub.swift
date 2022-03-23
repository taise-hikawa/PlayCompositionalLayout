//
//  Item+Stub.swift
//  PlayCompositionalLayout
//
//  Created by 樋川大聖 on 2022/03/23.
//

import Foundation


extension Item {
    static func stub(id: Int) -> Self{
        .init(id: id, price: 9000, imageName: "sample", brandName: "sample\(String(id))")
    }
}
