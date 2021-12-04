//
//  ViewController.swift
//  MVVM
//
//  Created by wahid tariq on 03/12/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  
    @IBOutlet var tableView: UITableView!
    var arrMovieVM = [MovieViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        Service.sharedInstance.getAllMovieData { (movies,error) in
            if error == nil{
                self.arrMovieVM = movies?.map({ return MovieViewModel(movie: $0) }) ?? []
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMovieVM.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let mvm = arrMovieVM[indexPath.row]
        cell.textLabel?.text = mvm.artistName ?? ""
        cell.detailTextLabel?.text = mvm.trackName ?? ""
        return cell
        
    }

}





