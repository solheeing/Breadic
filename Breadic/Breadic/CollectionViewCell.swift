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

        NameLbl.font = UIFont.boldSystemFont(ofSize: 16)
        NameLbl.textAlignment = .center
        NameLbl.numberOfLines = 2
        NameLbl.adjustsFontSizeToFitWidth = true

        PriceLbl.font = UIFont.systemFont(ofSize: 14)
        PriceLbl.textAlignment = .center

        StarLbl.font = UIFont.systemFont(ofSize: 13)
        StarLbl.textAlignment = .center

        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }
    
}
