//
//  ViewController.swift
//  PlayCompositionalLayout
//
//  Created by 樋川大聖 on 2022/03/19.
//

import UIKit

class ViewController: UIViewController {

    private var sections = [SectionProtocol]()

    private (set) lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)
        collectionView.register(type: HeaderCell.self,
                                kind: UICollectionView.elementKindSectionHeader)
        collectionView.register(type: BannerCell.self)
        collectionView.register(type: ItemCell.self)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.refreshControl = refreshControl
        return collectionView
    }()

    private lazy var compositionalLayout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { [unowned self] section, environment in
            sections[section].layoutSection(self.view)
        }
        return layout
    }()

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(onRefresh(_:)), for: .valueChanged)
        return refreshControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])

        fetchData()
    }

    @objc private func onRefresh(_ sender: Any) {
        fetchData()
    }

    private func fetchData() {
        // usually fetch here
        var banners = [Banner]()
        for index in 1...10 {
            banners.append(.stub(id: index))
        }
        var items = [Item]()
        for index in 1...10 {
            items.append(.stub(id: index))
        }
        sections = [
            BannerSection(banners: banners),
            ItemsSection(items: items, type: .history),
            ItemsSection(items: items, type: .sale),
            ItemsSection(items: items, type: .recommend)
        ]
        collectionView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.refreshControl.endRefreshing()
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(self, at: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].selectItem(self, at: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            return sections[indexPath.section].header(self, at: indexPath)
        default: fatalError("unexpected supplement kind")
        }
    }
}

