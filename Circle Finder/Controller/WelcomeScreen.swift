

import UIKit
import CLTypingLabel



class WelcomeScreen: UIViewController {
    
    
    @IBOutlet weak var startButtonIsRounded: UIButton!
    
    
    @IBOutlet weak var appTitleLabel: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view
        appTitleLabel.text = "Circle Finder"
        startButtonIsRounded.layer.cornerRadius = 15
        
        
    }
    
    
    
    
    
    
    
}
