//
//  UIString+Extension.swift
//  HomeWork2.2-Colorful_Interface
//
//  Created by vtsyganov on 04.06.2021.
//

import UIKit

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    
    var formatValue2f: String {
        String(format: "%.2f", self)
    }
}
