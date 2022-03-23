//
//  HeaderCell.swift
//  PlayCompositionalLayout
//
//  Created by 樋川大聖 on 2022/03/23.
//

import UIKit
import SwiftUI

class HeaderCell: UICollectionViewCell {
    var title: String?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(title: String) {
        self.title = title
        if let view = UIHostingController(rootView: HeaderCellView(title: title, showMore: {})).view {
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

struct HeaderCellView: View {
    var title: String
    var showMore: () -> Void

    var body: some View {
        HStack(alignment: .bottom) {
            Text(title)
                .font(.headline)
            Spacer()
            Button(action: showMore, label: {
                Text("もっと見る")
                    .font(.caption)
            })
        }
        .padding()
    }
}

struct HeaderCellView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCellView(title: "おすすめ", showMore: {})
            .previewLayout(.fixed(width: 300, height: 44))
    }
}
