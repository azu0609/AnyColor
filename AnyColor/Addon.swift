//
//  Addon.swift
//  AnyColor
//
//  Created by azuki on 2024/04/28.
//

import Foundation
import UIKit

extension UIColor {
    func toHex(alpha: Bool = false) -> String {
        guard let components = self.cgColor.components, components.count >= 3 else {
            return "#000000"
        }
        
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        
        var hex = String(format: "#%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        
        if alpha {
            let a = Float(self.cgColor.alpha)
            hex += String(format: "%02lX", lroundf(a * 255))
        }
        
        return hex
    }
}
