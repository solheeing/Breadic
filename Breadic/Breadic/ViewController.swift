//
//  ViewController.swift
//  Breadic
//
//  Created by 조은소리 on 4/12/25.
//

//import UIKit
//
//// 1. 커스텀 구조체 정의
//struct Bread {
//    let name: String
//    let imageName: String
//    let price: Double
//    let star: Int
//}
//
//class ViewController: UIViewController {
//    
//    @IBOutlet weak var collectionView: UICollectionView!
//    
//    // 2. Bread 배열로 데이터 통합
//    var breadList: [Bread] = [
//        Bread(name: "Ovo Crunchy Roll", imageName: "Ovo Crunchy Roll", price: 2.20, star: 5),
//        Bread(name: "Apfeltasche", imageName: "Apfeltasche", price: 1.69, star: 2),
//        Bread(name: "Himbeer-Vanille Plunder", imageName: "Himbeer-Vanille Plunder", price: 2.10, star: 4),
//        Bread(name: "Mandelnest", imageName: "Mandelnest", price: 2.75, star: 2),
//        Bread(name: "Pistaziencroissant", imageName: "Pistaziencroissant", price: 1.19, star: 5)
//    ]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.edgesForExtendedLayout = [.top]
//        
//        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            let itemsPerRow: CGFloat = 2
//            let spacing: CGFloat = 10
//            let totalSpacing = spacing * (itemsPerRow + 1)
//            let width = (collectionView.bounds.width - totalSpacing) / itemsPerRow
//            
//            layout.itemSize = CGSize(width: width, height: width * 1.3)
//            layout.minimumInteritemSpacing = spacing
//            layout.minimumLineSpacing = spacing
//            collectionView.contentInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
//        }
//        
//        let selectedImage = UIImage(named: "homeIcon")?.withRenderingMode(.alwaysOriginal)
//        let unselectedImage = UIImage(named: "homeIcon")?.withRenderingMode(.alwaysTemplate)
//        
//        tabBarItem = UITabBarItem(title: "Home", image: unselectedImage, selectedImage: selectedImage)
//    }
//}
//
//extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return breadList.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
//        
//        cell.layer.borderWidth = 1
//        cell.layer.cornerRadius = 10
//        
//        // 3. breadList에서 가져온 데이터로 설정
//        let bread = breadList[indexPath.row]
//        cell.NameLbl.text = bread.name
//        cell.imageView.image = UIImage(named: bread.imageName)
//        cell.PriceLbl.text = String(format: "%.2fCHF", bread.price)
//        cell.StarLbl.text = String(repeating: "⭐️", count: bread.star)
//        
//        return cell
//    }
//}
