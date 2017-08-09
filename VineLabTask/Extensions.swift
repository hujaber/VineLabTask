//
//  Extensions.swift
//  VineLabTask
//
//  Created by Administrator on 8/9/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    fileprivate enum AppColors {
        static let appBlue = 0xFF1DAAFC
    }

    fileprivate enum AgeRange {
        static let def = 0xFFE4E4E4
        static let others = 0xFF212121
        static let ageRange_13_17 = 0xC0E8FF
        static let ageRange_18_24 = 0x97D9FF
        static let ageRange_25_34 = 0x68C8FF
        static let ageRange_35_44 = 0x4ABCFF
        static let ageRange_45_54 = 0x30B3FF
        static let ageRange_55_64 = 0x13A8FF
    }

    fileprivate enum Score {
        static let quality =  0xFF212121
        static let discovery = 0xFFBE9DED
        static let consumption = 0xFFFFC65C
        static let stickiness = 0xFFABEC01
        static let engagement = 0xFFEF3C79
        static let amplification = 0xFF01BBD6
    }

    static let appBlue = UIColor.init(argb: AppColors.appBlue)
    static let ageDefault = UIColor.init(argb: AgeRange.def)
    static let age_13_17 = UIColor.init(argb: AgeRange.ageRange_13_17)
    static let age_18_24 = UIColor.init(argb: AgeRange.ageRange_18_24)
    static let age_25_34 = UIColor.init(argb: AgeRange.ageRange_25_34)
    static let age_35_44 = UIColor.init(argb: AgeRange.ageRange_35_44)
    static let age_45_54 = UIColor.init(argb: AgeRange.ageRange_45_54)
    static let age_55_64 = UIColor.init(argb: AgeRange.ageRange_55_64)

    static let scoreQuality = UIColor.init(argb: Score.quality)
    static let scoreDiscovery = UIColor.init(argb: Score.discovery)
    static let scoreConsumption = UIColor.init(argb: Score.consumption)
    static let scoreStickiness = UIColor.init(argb: Score.stickiness)
    static let scoreEngagement = UIColor.init(argb: Score.engagement)
    static let scoreAmplification = UIColor.init(argb: Score.amplification)
    

    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }

    // let's suppose alpha is the first component (ARGB)
    convenience init(argb: Int) {
        self.init(
            red: (argb >> 16) & 0xFF,
            green: (argb >> 8) & 0xFF,
            blue: argb & 0xFF,
            a: (argb >> 24) & 0xFF
        )
    }
}
