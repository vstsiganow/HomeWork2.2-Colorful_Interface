//
//  RGB.swift
//  HomeWork2.2-Colorful_Interface
//
//  Created by vtsyganov on 05.06.2021.
//

import UIKit

struct RGBA {
    var r: Float
    var g: Float
    var b: Float
    var a: Float
    
    var getColor: UIColor {
        UIColor(
            red: CGFloat(r),
            green: CGFloat(g),
            blue: CGFloat(b),
            alpha: CGFloat(a)
        )
    }

    var colorList: [Float] {
        [r, g, b, a]
    }
}
