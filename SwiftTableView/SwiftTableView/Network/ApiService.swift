//
//  ApiService.swift
//  SwiftTableView
//
//  Created by Pranesh on 2018/08/07.
//  Copyright © 2018 Pranesh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiService {
    
    func fetchJSON(at url: String, _ completion: @escaping (JSON?, Error?) -> Void) {
        Alamofire.request(url).validate().responseJSON { (response) -> Void in
            switch response.result {
            case .success(let value):
                completion(JSON(value), nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

