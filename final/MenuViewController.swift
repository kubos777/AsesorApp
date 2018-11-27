//
//  MenuViewController.swift
//  final
//
//  Created by kubos on 11/27/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var greetingOutlet: UILabel!
    
    @IBAction func unwindToMenuView(unwindSegue: UIStoryboardSegue) {
        
    }
    
    var greeting: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        greetingOutlet.text = greeting!
        // Do any additional setup after loading the view.
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
