//
//  ProductCollectionViewCell.swift
//  Restaurante
//
//  Created by Ana Paula Flores on 21/03/24.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var product: UIImageView!
    @IBOutlet weak var price: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

}
