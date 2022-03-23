//
//  ItemCell.swift
//  PlayCompositionalLayout
//
//  Created by 樋川大聖 on 2022/03/23.
//

import UIKit
import SwiftUI

class ItemCell: HostingCell<ItemCellView> {
    var item: Item?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(item: Item, parent: UIViewController) {
        self.item = item
        let hostingController = UIHostingController(rootView: ItemCellView(item: item))
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

class HostingCell<Content: View>: UICollectionViewCell {

    private let hostingController = UIHostingController<Content?>(rootView: nil)

    override public init(frame: CGRect) {
        super.init(frame: frame)
        hostingController.view.backgroundColor = .clear
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(_ view: Content, parent: UIViewController) {
        hostingController.rootView = view
        hostingController.view.invalidateIntrinsicContentSize()

        guard hostingController.parent == nil else { return }
        // 以下は初回のみ実行
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
