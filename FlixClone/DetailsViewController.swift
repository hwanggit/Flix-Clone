//
//  DetailsViewController.swift
//  FlixClone
//
//  Created by Howard Wang on 1/30/20.
//  Copyright © 2020 hwang. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(movie["title"])
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
