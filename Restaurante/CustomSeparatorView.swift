//
//  CustomSeparatorView.swift
//  Restaurante
//
//  Created by Ana Paula Flores on 22/03/24.
//

import Foundation
import UIKit
class CustomSeparatorView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white  // Color del separador (blanco en este caso)
        self.translatesAutoresizingMaskIntoConstraints = false
        // Personaliza otros aspectos de la vista, como el grosor, altura, etc.
    }
}
