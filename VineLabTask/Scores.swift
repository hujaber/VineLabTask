//
//  Scores.swift
//  VineLabTask
//
//  Created by Administrator on 8/9/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

import UIKit


public struct Scores {
    let quality: Quality?
    let consistency: Consistency?
    let discovery: Any?
    let consumption: Consumption?
    let stickiness: Any?
    let engagement: Engagement?
    let amplification: Any?

    init(json: [String: Any]) {
        quality = Quality.init(json: json["quality"] as! [String: Any])
        consistency = Consistency.init(json: json["consistency"] as! [String: Any])
        discovery = json["discovery"]
        consumption = Consumption.init(json: json["consumption"] as! [String: Any])
        stickiness = json["stickiness"]
        engagement = Engagement.init(json: json["engagement"] as! [String: Any])
        amplification = json["amplification"]
    }
}


struct Quality {
    let score: CGFloat?
    let status: Int?
    let video: Video?
    let photo: Photo?
    let link: String?
    init(json: [String: Any]) {
        score = json["score"] as? CGFloat
        status = json["status"] as? Int
        video = Video.init(json: json["video"] as! [String : Any])
        photo = Photo.init(json: json["photo"] as! [String: Any])
        link = json["link"] as? String
    }
}

struct Consistency {
    let score: CGFloat?
    let status: Int?
    let video: Video?
    let photo: Photo?
    let link: String?
    init(json: [String: Any]) {
        score = json["score"] as? CGFloat
        status = json["status"] as? Int
        video = Video.init(json: json["video"] as! [String : Any])
        photo = Photo.init(json: json["photo"] as! [String: Any])
        link = json["link"] as? String
    }
}

struct Consumption {
    let score: CGFloat?
    let status: Int?
    let video: Video?
    let photo: Photo?
    let link: String?
    init(json: [String: Any]) {
        score = json["score"] as? CGFloat
        status = json["status"] as? Int
        video = Video.init(json: json["video"] as! [String : Any])
        photo = Photo.init(json: json["photo"] as! [String: Any])
        link = json["link"] as? String
    }
}

struct Engagement {
    let score: CGFloat?
    let status: Int?
    let video: Video?
    let photo: Photo?
    let link: String?
    init(json: [String: Any]) {
        score = json["score"] as? CGFloat
        status = json["status"] as? Int
        video = Video.init(json: json["video"] as! [String : Any])
        photo = Photo.init(json: json["photo"] as! [String: Any])
        link = json["link"] as? String
    }
}

struct Photo {
    let score: CGFloat?
    let status: Int?

    init(json: [String: Any]) {
        score = json["score"] as? CGFloat
        status = json["status"] as? Int
    }
}

struct Video {
    let score: CGFloat?
    let status: Int?

    init(json: [String: Any]) {
        score = json["score"] as? CGFloat
        status = json["status"] as? Int
    }
}


