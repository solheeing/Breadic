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
        Bread(name: "Himbeer-Vanille Plunder", imageName: "Himbeer-Vanille Plunder", price: 2.10, star: 4),
        Bread(name: "Berliner Aprikose", imageName: "Berliner Aprikose", price: 1.50, star: 2),
        Bread(name: "Sapori Cornetti Pistacchio", imageName: "Pistaziencroissant", price: 1.95, star: 5),
        Bread(name: "Ovo Crunchy Roll", imageName: "Ovo Crunchy Roll", price: 2.30, star: 5),
        Bread(name: "Berliner", imageName: "Berliner", price: 1.50, star: 4),
        Bread(name: "Nussgifel", imageName: "Nussgifel", price: 1.95, star: 2),
        Bread(name: "Max Havelaar Choco Croissant", imageName: "Munz-Schoggigipfel", price: 1.95, star: 4)
    ]

    var hasSetLayout = false

    override func viewDidLoad() {
        super.viewDidLoad()
        CoopCollectionView.delegate = self
        CoopCollectionView.dataSource = self
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
        if let layout = CoopCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let spacing: CGFloat = 10
            let itemWidth: CGFloat = 172.5
            let itemHeight: CGFloat = 276 // width의 1.6배

            layout.estimatedItemSize = .zero // 자동 크기 계산 끄기
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
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
