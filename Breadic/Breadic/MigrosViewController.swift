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
        Bread(name: "Himbeer-Vanille Plunder", imageName: "Himbeer-Vanille Plunder", price: 1.70, star: 4),
        Bread(name: "Himbeer-Vanille Plunder", imageName: "Himbeer-Vanille Plunder", price: 1.70, star: 4),
        Bread(name: "Himbeer-Vanille Plunder", imageName: "Himbeer-Vanille Plunder", price: 1.70, star: 4),
        Bread(name: "Himbeer-Vanille Plunder", imageName: "Himbeer-Vanille Plunder", price: 1.70, star: 4)
    ]
    
    var hasSetLayout = false

    override func viewDidLoad() {
        super.viewDidLoad()
        MigrosCollectionView.delegate = self
        MigrosCollectionView.dataSource = self
        setupCollectionViewLayout() // 다시 여기서 호출
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !hasSetLayout {
            setupCollectionViewLayout()
            hasSetLayout = true
        }
    }

    func setupCollectionViewLayout() {
        if let layout = MigrosCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let spacing: CGFloat = 10
            let itemWidth: CGFloat = 172.5
            let itemHeight: CGFloat = 276 // width의 1.6배

            layout.estimatedItemSize = .zero // 자동 크기 계산 끄기
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
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
