//
//  ExtensionDouble.swift
//  swift_assigment_01
//
//  Created by Carlos Jose Bulado on 2018-09-14.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

extension Double
{
    func Currency() -> String
    {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        if let formatNumber = formatter.string(from: self as NSNumber) {
            return "\(formatNumber)"
        }
        
        return "$ \(self)"
    }
    
    func FormattingDouble() -> String
    {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        if let formatNumber = formatter.string(from: self as NSNumber) {
            return "\(formatNumber)"
        }
        
        return "$ \(self)"
    }
}
