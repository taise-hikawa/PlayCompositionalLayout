//
//  BannerCell.swift
//  PlayCompositionalLayout
//
//  Created by 樋川大聖 on 2022/03/24.
//

import UIKit
import SwiftUI

class BannerCell: UICollectionViewCell {
    var banner: Banner?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(banner: Banner, parent: UIViewController) {
        self.banner = banner
        let hostingController = UIHostingController(rootView: BannerCellView(banner: banner))
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

struct BannerCellView: View {
    let banner: Banner
    var body: some View {
        Image(banner.thumbnailName)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
    }
}

struct BannerCellView_Previews: PreviewProvider {
    static var previews: some View {
        BannerCellView(banner: .stub(id: 1))
            .previewLayout(.fixed(width: 300, height: 90))
    }
}
