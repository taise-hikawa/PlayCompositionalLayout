//
//  Banner+Stub.swift
//  PlayCompositionalLayout
//
//  Created by 樋川大聖 on 2022/03/24.
//

import Foundation

extension Banner {
    static func stub(id: Int) -> Self {
        .init(id: id, thumbnailName: "sampleBanner", url: URL(fileURLWithPath: "https://www.google.com/"))
    }
}
