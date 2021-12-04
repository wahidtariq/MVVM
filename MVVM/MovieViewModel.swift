//
//  MovieViewModel.swift
//  MVVM
//
//  Created by wahid tariq on 03/12/21.
//

import UIKit

class MovieViewModel: NSObject {
    
    var artistName: String?
    var trackName: String?
    
// Dependency Injection
    
     
    
    
    init(movie: MovieModel){
        self.artistName = movie.artistName
        self.trackName = movie.trackName
    }
    

}
