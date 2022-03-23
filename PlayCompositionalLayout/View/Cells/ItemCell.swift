//
//  ItemCell.swift
//  PlayCompositionalLayout
//
//  Created by 樋川大聖 on 2022/03/23.
//

import UIKit
import SwiftUI

class ItemCell: UICollectionViewCell {
    var item: Item?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(item: Item) {
        self.item = item
        if let view = UIHostingController(rootView: ItemCellView(item: item)).view {
            contentView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: contentView.topAnchor),
                view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        }
    }
}

struct ItemCellView: View {
    let item: Item
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
            Text(item.brandName)
                .font(.caption)
            Text("¥\(item.price.price)")
                .font(.body)
        }
        .padding()
    }
}

struct ItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCellView(item: .stub(id: 1))
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
