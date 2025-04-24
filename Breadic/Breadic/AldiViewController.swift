//
//  AldiViewController.swift
//  Breadic
//
//  Created by 조은소리 on 4/16/25.
//

import UIKit

class AldiViewController: UIViewController {

    @IBOutlet weak var AldiCollectionView: UICollectionView!

    var hasSetLayout = false

    let breadList: [Bread] = [
        Bread(name: "Ovo Crunchy Roll", imageName: "Ovo Crunchy Roll", price: 2.20, star: 5),
        Bread(name: "Apfeltasche", imageName: "Apfeltasche", price: 1.89, star: 2),
        Bread(name: "Mandelnest", imageName: "Mandelnest", price: 2.75, star: 2),
        Bread(name: "Herzdonut", imageName: "Herzdonut", price: 0.99, star: 4),
        Bread(name: "Himbeer-Vanille Plunder", imageName: "Himbeer-Vanille Plunder", price: 1.59, star: 4),
        Bread(name: "Pistaziencroissant", imageName: "Pistaziencroissant", price: 1.19, star: 5),
        Bread(name: "Munz-Schoggigipfel", imageName: "Munz-Schoggigipfel", price: 1.49, star: 4),
        Bread(name: "Schoggi Donut", imageName: "Schoggi Donut", price: 0.89, star: 4),
        Bread(name: "Pistazienberliner", imageName: "Pistazienberliner", price: 0.99, star: 3)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        AldiCollectionView.delegate = self
        AldiCollectionView.dataSource = self
        setupCollectionViewLayout()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !hasSetLayout {
            setupCollectionViewLayout()
            hasSetLayout = true
        }
    }

    func setupCollectionViewLayout() {
        if let layout = AldiCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let spacing: CGFloat = 10
            let itemWidth: CGFloat = 172.5
            let itemHeight: CGFloat = 276 // width의 1.6배

            layout.estimatedItemSize = .zero
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            layout.minimumInteritemSpacing = spacing
            layout.minimumLineSpacing = spacing
            AldiCollectionView.contentInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        }
    }
}

extension AldiViewController: UICollectionViewDelegate, UICollectionViewDataSource {

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
