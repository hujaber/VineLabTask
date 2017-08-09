//
//  APICalls.swift
//  VineLabTask
//
//  Created by Hussein Jaber on 9/8/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

import Foundation
import Alamofire

enum APIURLString {
    static let scores = "https://api.myjson.com/bins/zvr7l"
    static let audienceSizeValues = "https://api.myjson.com/bins/19iz7l"
    static let audienceSize = "https://api.myjson.com/bins/suu9t"
    static let demographicsAge = "https://api.myjson.com/bins/6vy1t"
    static let demographicsGender = "https://api.myjson.com/bins/c8uht"
}

class APIRequests {

    fileprivate static func request(urlString: String!, parameters: Parameters?, method: HTTPMethod, completion: @escaping (Bool, Error?, String?, DataResponse<Any>?) ->()) {
        //Alamofire.request(urlString, method: nil, parameters: Parameters);
        Alamofire.request(urlString, method: method, parameters: parameters).responseJSON { (response) in
            let success = checkIfSuccess(response: response)
            if success {
                completion(success, nil, nil, response)
            } else {
                completion(success, nil, "Failed", nil)
            }
        }
    }
    
    fileprivate static func checkIfSuccess(response: DataResponse<Any>!) -> Bool {
        if let responseDict = response.result.value as? [String: Any] {
            if let successCode = responseDict["status"] as? Int {
                return successCode == 200
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    static func getScores(completion: @escaping (Bool, Error?, String?, Scores?, [String: Any]?) ->()) {
        request(urlString: APIURLString.scores, parameters: nil, method: .get) { (success, error, errorMessage, response) in
            if success {
                guard let responseDictionary = response?.result.value as? [String: Any] else {
                    return
                }
                let scores = Scores.init(json: responseDictionary["data"] as! [String : Any])
                completion(true, nil, nil, scores, responseDictionary)
            } else {
                completion(false, response?.result.error, "Failed", nil, nil)
            }
        }
    }

}
