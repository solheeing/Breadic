//
//  CollectionViewCell.swift
//  Breadic
//
//  Created by 조은소리 on 4/12/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var NameLbl: UILabel!
    @IBOutlet weak var PriceLbl: UILabel!
    @IBOutlet weak var StarLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        NameLbl.font = UIFont.boldSystemFont(ofSize: 16)
        NameLbl.textAlignment = .center
        NameLbl.numberOfLines = 2 //이름 라벨 2줄 제한
        NameLbl.lineBreakMode = .byWordWrapping
        NameLbl.adjustsFontSizeToFitWidth = false

        PriceLbl.font = UIFont.systemFont(ofSize: 15)
        PriceLbl.textAlignment = .center

        StarLbl.font = UIFont.systemFont(ofSize: 14)
        StarLbl.textAlignment = .center
    }
    
}
