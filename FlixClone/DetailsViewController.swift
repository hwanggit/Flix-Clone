//
//  DetailsViewController.swift
//  FlixClone
//
//  Created by Howard Wang on 1/30/20.
//  Copyright © 2020 hwang. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var backDropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieSynopsis: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        movieTitle.text = movie["title"] as? String
        movieTitle.sizeToFit()
        movieSynopsis.text = movie["overview"] as? String
        movieSynopsis.sizeToFit()
        movieDate.text = movie["release_date"] as? String
        movieDate.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let imageUrl = movie["poster_path"] as! String
        
        if let posterUrl = URL(string: baseUrl + imageUrl) {
            posterView.af_setImage(withURL: posterUrl)
        }
        
        let backDropPath = movie["backdrop_path"] as! String
        
        if let backDropURL = URL(string: "https://image.tmdb.org/t/p/w500" + backDropPath) {
            backDropView
                .af_setImage(withURL: backDropURL)
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
