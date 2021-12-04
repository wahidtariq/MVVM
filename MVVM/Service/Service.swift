//
//  Service.swift
//  MVVM
//
//  Created by wahid tariq on 03/12/21.
//

import UIKit

class Service: NSObject {
    
    static let sharedInstance = Service()
    
    
    
    func getAllMovieData(completion: @escaping([MovieModel]?, Error?) -> ()){
        let urlString = "https://itunes.apple.com/search?media=music&term=bollywood"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                print("error while loading\(error)")
            }else{
                guard let data = data else { return }
                do{
                    var arrMovieData = [MovieModel]()
                    let decoder = JSONDecoder()
                   let results = try decoder.decode(ResultModel.self, from: data)
                    for movie in results.results{
                        arrMovieData.append(MovieModel(artistName: movie.artistName ?? "", trackName: movie.trackName ?? ""))
                        
                    }
                    completion(arrMovieData,nil)
                    
                }catch{
                    print(error.localizedDescription)
                }

            }
        }.resume()
    }
}
