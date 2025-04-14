//
//  ViewController.swift
//  Breadic
//
//  Created by 조은소리 on 4/12/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var images: [String] = ["Ovo Crunchy Roll", "Apfeltasche", "Himbeer-Vanille Plunder", "Mandelnest", "Pistaziencroissant"]
    var BreadNames: [String] = ["Ovo Crunchy Roll", "Apfeltasche", "Himbeer-Vanille Plunder", "Mandelnest", "Pistaziencroissant"]
    var BreadPrices: [String] = ["2.20CHF", "1.69CHF", "2.10CHF", "2.75CHF", "1.19CHF"]
    var Stars: [String] = ["⭐️⭐️⭐️⭐️⭐️","⭐️⭐️","⭐️⭐️⭐️⭐️","⭐️⭐️","⭐️⭐️⭐️⭐️⭐️"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemsPerRow: CGFloat = 2 // 한줄당 아이템 개수
            let spacing: CGFloat = 10 // 전체 스페이싱(마진 개념)

            let totalSpacing = spacing * (itemsPerRow + 1) // 양쪽 여백 + 사이 간격들
            let width = (collectionView.bounds.width - totalSpacing) / itemsPerRow

            layout.itemSize = CGSize(width: width, height: width * 1.3) // 셀 비율은 적당히 조절
            layout.minimumInteritemSpacing = spacing // 아이템 사이 간격
            layout.minimumLineSpacing = spacing // 줄간격
            collectionView.contentInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        }

    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BreadNames.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        cell.NameLbl.text = BreadNames[indexPath.row]
        cell.NameLbl.numberOfLines = 2
        cell.NameLbl.adjustsFontSizeToFitWidth = true
        cell.imageView.image = UIImage(named: images[indexPath.row])
        cell.PriceLbl.text = BreadPrices[indexPath.row]
        cell.StarLbl.text = Stars[indexPath.row]
        
        return cell
        
    }
    
}
