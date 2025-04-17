//
//  AldiViewController.swift
//  Breadic
//
//  Created by 조은소리 on 4/16/25.
//

import UIKit

class AldiViewController: UIViewController {
    
    @IBOutlet weak var AldiCollectionView: UICollectionView!
    
    let breadList: [Bread] = [
        Bread(name: "Ovo Crunchy Roll", imageName: "Ovo Crunchy Roll", price: 2.20, star: 5),
        Bread(name: "Apfeltasche", imageName: "Apfeltasche", price: 1.69, star: 2),
        Bread(name: "Himbeer-Vanille Plunder", imageName: "Himbeer-Vanille Plunder", price: 2.10, star: 4),
        Bread(name: "Mandelnest", imageName: "Mandelnest", price: 2.75, star: 2),
        Bread(name: "Pistaziencroissant", imageName: "Pistaziencroissant", price: 1.19, star: 5)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewLayout()
    }
    
    func setupCollectionViewLayout() {
        AldiCollectionView.delegate = self
        AldiCollectionView.dataSource = self
        
        if let layout = AldiCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemsPerRow: CGFloat = 2
            let spacing: CGFloat = 10
            let totalSpacing = spacing * (itemsPerRow + 1)
            let width = (AldiCollectionView.bounds.width - totalSpacing) / itemsPerRow
            layout.itemSize = CGSize(width: width, height: width * 1.5)
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
