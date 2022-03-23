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

    func configureCell(title: String, parent: UIViewController) {
        self.title = title
        let hostingController = UIHostingController(rootView: HeaderCellView(title: title, showMore: {}))
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.invalidateIntrinsicContentSize()
        guard hostingController.parent == nil else { return }
        parent.addChild(hostingController)
        contentView.addSubview(hostingController.view)
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        hostingController.didMove(toParent: parent)
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
