//
//  resultsViewController.swift
//  Circle Finder
//
//  Created by Aidan Doruska on 4/9/20.
//  Copyright © 2020 Aidan Doruska. All rights reserved.
//

import UIKit

class resultsViewController: UIViewController {
    
    
    var calculation = CalculationViewController()
    
    var radius : Double = 0.0
    
    

    @IBOutlet weak var radiusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        radiusLabel.text = String(radius)
        
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
