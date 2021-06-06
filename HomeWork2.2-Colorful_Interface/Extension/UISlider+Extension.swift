//
//  UISlider+Extension.swift
//  HomeWork2.2-Colorful_Interface
//
//  Created by vtsyganov on 04.06.2021.
//

import UIKit

extension UISlider {
    var stringFormatValue2f: String {
        String(format: "%.2f", self.value)
    }
    
    var floatFormatValue2f: Float {
        Float(String(format: "%.2f", self.value)) ?? 0.5
    }
}
