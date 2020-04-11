//
//  ResultsViewController!.swift
//  Circle Finder
//
//  Created by Aidan Doruska on 4/10/20.
//  Copyright © 2020 Aidan Doruska. All rights reserved.
//

import UIKit
import RealmSwift
class ResultsViewController_: UIViewController {


   
    let realm = try! Realm()
    
    var answers : Results<AnswerDataBase>? //updated results in real time
    
    //selected units of measure
    var units : String?
    
    
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        uploadStats()
        

        // Do any additional setup after loading the view.
    }

        
    
        
    
    func uploadStats(){
        let results = realm.objects(AnswerDataBase.self)
        //sets local variables which will be formatted to 4 decimal places
        let radius = results[0].radius //long double
        let diameter = results[0].diameter //long double
        let circumference = results[0].circumference
        let area = results[0].area
        
        
        //assigns the calculated variables to their user interface labels
        rLabel.text = String(format: "%.4f \(units!)", radius)
        dLabel.text = String(format: "%.4f \(units!)", diameter)
        cLabel.text = String(format: "%.4f \(units!)", circumference)
        aLabel.text = String(format: "%.4f \(units!)^2", area)
        
      

        
        
        
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
