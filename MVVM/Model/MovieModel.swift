//
//  MovieModel.swift
//  MVVM
//
//  Created by wahid tariq on 03/12/21.
//

import UIKit

class MovieModel: Decodable  {
    var trackName: String?
    var artistName: String?
    
    init(artistName: String, trackName: String){
        self.artistName = artistName
        self.trackName = trackName
    }
}

class ResultModel: Decodable{
    var results = [MovieModel]()
    
    init(results: [MovieModel]) {
        self.results = results
    }
}
