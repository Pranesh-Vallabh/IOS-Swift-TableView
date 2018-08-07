//
//  ApiClient.swift
//  SwiftTableView
//
//  Created by Pranesh on 2018/08/07.
//  Copyright © 2018 Pranesh. All rights reserved.
//

import Foundation
import SwiftyJSON

class ApiClient {
    
    func getFilms(_ completion: @escaping ([Film]?, Error?) -> Void) {
        let apiService = ApiService()
        
        apiService.fetchJSON(at: Constants.ApiUrl) { (jsonObject,error) -> Void in
            var films = [Film]()
            if let jsonObject = jsonObject {
                
                jsonObject.array?.forEach({ (film) in
                    let filmData = Film(id: film["id"].stringValue,
                                        title: film["title"].stringValue,
                                        description: film["description"].stringValue,
                                        director: film["director"].stringValue,
                                        producer: film["producer"].stringValue,
                                        releaseDate: film["release_date"].stringValue,
                                        rottenTomatoesScore: film["rt_score"].stringValue)
                    films.append(filmData)
            })
        }
        completion(films, error)
    }
 }
}

