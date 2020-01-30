//
//  ViewController.swift
//  FlixClone
//
//  Created by Jacklyn Hu on 1/23/20.
//  Copyright © 2020 hwang. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var moviesTable: UITableView!
    
    var movies = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        moviesTable.dataSource = self
        moviesTable.delegate = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.movies = dataDictionary["results"] as! [[String:Any]]
                
                self.moviesTable.reloadData()
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTable.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let imageUrl = movie["poster_path"] as! String
        
        cell.movieTitle.text = title
        cell.movieSynopsis.text = synopsis
        
        if let posterUrl = URL(string: baseUrl + imageUrl) {
            cell.moviePoster.af_setImage(withURL: posterUrl)
        }
        
        return cell
    }
}

