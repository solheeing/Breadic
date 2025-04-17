//
//  CoopViewController.swift
//  Breadic
//
//  Created by 조은소리 on 4/16/25.
//

import UIKit

class CoopViewController: UIViewController {

    @IBOutlet weak var CoopCollectionView: UICollectionView!
    
    let breadList: [Bread] = [
        Bread(name: "Kürbiskernbrot", imageName: "Kürbiskernbrot", price: 3.10, star: 4),
        Bread(name: "Vollkornbrötli", imageName: "Vollkornbrötli", price: 2.00, star: 3),
        Bread(name: "Berner Mütschli", imageName: "Berner Mütschli", price: 2.90, star: 5),
        Bread(name: "Rustico", imageName: "Rustico", price: 2.40, star: 2)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewLayout()
    }

    func setupCollectionViewLayout() {
        CoopCollectionView.delegate = self
        CoopCollectionView.dataSource = self

        if let layout = CoopCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemsPerRow: CGFloat = 2
            let spacing: CGFloat = 10
            let totalSpacing = spacing * (itemsPerRow + 1)
            let width = (CoopCollectionView.bounds.width - totalSpacing) / itemsPerRow
            layout.itemSize = CGSize(width: width, height: width * 1.5)
            layout.minimumInteritemSpacing = spacing
            layout.minimumLineSpacing = spacing
            CoopCollectionView.contentInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        }
    }
}

extension CoopViewController: UICollectionViewDelegate, UICollectionViewDataSource {

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
