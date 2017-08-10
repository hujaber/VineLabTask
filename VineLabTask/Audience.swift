//
//  Audience.swift
//  VineLabTask
//
//  Created by Administrator on 8/10/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

import UIKit

struct AudienceSizeGrowth {
    let date: String?
    let size: CGFloat?
    let percentage: CGFloat?
    init(json: [String: AnyObject]?) {
        date = json?["date"] as? String
        size = json?["mena"]?["size"] as? CGFloat
        percentage = json?["mena"]?["percentage"] as? CGFloat
    }
}


struct AudienceSizeValues {
    let size: CGFloat?
    let percentage: CGFloat?
    init(json: [String: AnyObject]) {
        size = json["mena_size"] as? CGFloat
        percentage = json["mena_percentage"] as? CGFloat
    }
}
