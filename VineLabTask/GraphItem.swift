//
//  GraphItem.swift
//  VineLabTask
//
//  Created by Administrator on 8/10/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

import Foundation
import UIKit

struct GraphItem {
    let ageGroup: String?
    let value: CGFloat?

    init(json: [String: Any]?) {
        ageGroup = json?["age_group"] as? String
        value = json?["value"] as? CGFloat
    }
}
