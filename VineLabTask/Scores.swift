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
    let discovery: Discovery?
    let consumption: Consumption?
    let stickiness: Stickiness?
    let engagement: Engagement?
    let amplification: Amplification?

    init(json: [String: Any]) {
        quality = Quality.init(json: json["quality"] as? [String: Any])
        consistency = Consistency.init(json: json["consistency"] as? [String: Any])
        discovery = Discovery.init(json: json["discovery"] as? [String: Any])
        consumption = Consumption.init(json: json["consumption"] as? [String: Any])
        stickiness = Stickiness.init(json: json["stickiness"] as? [String: Any])
        engagement = Engagement.init(json: json["engagement"] as? [String: Any])
        amplification = Amplification.init(json: json["amplification"] as? [String: Any])
    }
}


struct Quality {
    let score: CGFloat?
    let status: Int?
    let video: Video?
    let photo: Photo?
    let link: Link?
    init(json: [String: Any]?) {
        score = json?["score"] as? CGFloat
        status = json?["status"] as? Int
        video = Video.init(json: json?["video"] as? [String : Any])
        photo = Photo.init(json: json?["photo"] as? [String: Any])
        link = Link.init(json: json?["link"] as? [String: Any])
    }
}

struct Consistency {
    let score: CGFloat?
    let status: Int?
    let video: Video?
    let photo: Photo?
    let link: Link?
    init(json: [String: Any]?) {
        score = json?["score"] as? CGFloat
        status = json?["status"] as? Int
        video = Video.init(json: json?["video"] as? [String : Any])
        photo = Photo.init(json: json?["photo"] as? [String: Any])
        link = Link.init(json: json?["link"] as? [String: Any])
    }
}

struct Consumption {
    let score: CGFloat?
    let status: Int?
    let video: Video?
    let photo: Photo?
    let link: Link?
    init(json: [String: Any]?) {
        score = json?["score"] as? CGFloat
        status = json?["status"] as? Int
        video = Video.init(json: json?["video"] as? [String : Any])
        photo = Photo.init(json: json?["photo"] as? [String: Any])
        link = Link.init(json: json?["link"] as? [String: Any])
    }
}

struct Engagement {
    let score: CGFloat?
    let status: Int?
    let video: Video?
    let photo: Photo?
    let link: Link?
    init(json: [String: Any]?) {
        score = json?["score"] as? CGFloat
        status = json?["status"] as? Int
        video = Video.init(json: json?["video"] as? [String : Any])
        photo = Photo.init(json: json?["photo"] as? [String: Any])
        link = Link.init(json: json?["link"] as? [String: Any])
    }
}

struct Discovery {
    let score: CGFloat?
    let status: Int?
    let video: Video?
    let photo: Photo?
    let link: Link?
    init(json: [String: Any]?) {
        score = json?["score"] as? CGFloat
        status = json?["status"] as? Int
        video = Video.init(json: json?["video"] as? [String : Any])
        photo = Photo.init(json: json?["photo"] as? [String: Any])
        link = Link.init(json: json?["link"] as? [String: Any])
    }
}

struct Stickiness {
    let score: CGFloat?
    let status: Int?
    let video: Video?
    let photo: Photo?
    let link: Link?
    init(json: [String: Any]?) {
        score = json?["score"] as? CGFloat
        status = json?["status"] as? Int
        video = Video.init(json: json?["video"] as? [String : Any])
        photo = Photo.init(json: json?["photo"] as? [String: Any])
        link = Link.init(json: json?["link"] as? [String: Any])
    }
}

struct Amplification {
    let score: CGFloat?
    let status: Int?
    let video: Video?
    let photo: Photo?
    let link: Link?
    init(json: [String: Any]?) {
        score = json?["score"] as? CGFloat
        status = json?["status"] as? Int
        video = Video.init(json: json?["video"] as? [String : Any])
        photo = Photo.init(json: json?["photo"] as? [String: Any])
        link = Link.init(json: json?["link"] as? [String: Any])
    }
}

struct Photo {
    let score: CGFloat?
    let status: Int?

    init(json: [String: Any]?) {
        score = json?["score"] as? CGFloat
        status = json?["status"] as? Int
    }
}

struct Video {
    let score: CGFloat?
    let status: Int?

    init(json: [String: Any]?) {
        score = json?["score"] as? CGFloat
        status = json?["status"] as? Int
    }
}

struct Link {
    let score: CGFloat?
    let status: Int?

    init(json: [String: Any]?) {
        score = json?["score"] as? CGFloat
        status = json?["status"] as? Int
    }
}


