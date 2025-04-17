//
//  MigrosViewController.swift
//  Breadic
//
//  Created by 조은소리 on 4/16/25.
//

import UIKit

class MigrosViewController: UIViewController {
    
    @IBOutlet weak var MigrosCollectionView: UICollectionView!
    
    let breadList: [Bread] = [
        Bread(name: "Butterzopf", imageName: "Butterzopf", price: 2.50, star: 4),
        Bread(name: "Laugenbrötli", imageName: "Laugenbrötli", price: 1.80, star: 3),
        Bread(name: "Croissant", imageName: "Croissant", price: 1.60, star: 5),
        Bread(name: "Ruchbrot", imageName: "Ruchbrot", price: 2.30, star: 2)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewLayout()
    }

    func setupCollectionViewLayout() {
        MigrosCollectionView.delegate = self
        MigrosCollectionView.dataSource = self

        if let layout = MigrosCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemsPerRow: CGFloat = 2
            let spacing: CGFloat = 10
            let totalSpacing = spacing * (itemsPerRow + 1)
            let width = (MigrosCollectionView.bounds.width - totalSpacing) / itemsPerRow
            layout.itemSize = CGSize(width: width, height: width * 1.5)
            layout.minimumInteritemSpacing = spacing
            layout.minimumLineSpacing = spacing
            MigrosCollectionView.contentInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        }
    }
}

extension MigrosViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return breadList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell

        let bread = breadList[indexPath.row]
        cell.NameLbl.text = bread.name
        cell.imageView.image = UIImage(named: bread.imageName)
        cell.PriceLbl.text = String(format: "%.2fCHF", bread.price)
        cell.StarLbl.text = String(repeating: "⭐️", count: bread.star)

        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10

        return cell
    }
    
}
