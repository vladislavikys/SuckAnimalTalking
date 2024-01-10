//
//  UIViewAndShadow.swift
//  SuckAnimalTalking
//
//  Created by Влад on 10.01.24.
//

import Foundation
import UIKit


extension UIView {
    func addDefaultShadow(
        opacity: Float,
        shadowRadius: CGFloat,
        shadowColor: CGColor,
        shadowOffset: CGSize = .zero
    ) {
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = shadowOffset
        self.layer.masksToBounds = false
    }
}
