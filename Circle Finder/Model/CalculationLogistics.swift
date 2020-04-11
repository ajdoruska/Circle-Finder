

import Foundation

struct CalculationLogistics {
    
    
    //    var userInputObject : CalculationViewController?
    // instance
    
    private var pi: Double = 3.14159
    
    var done: Bool = false 
    let unitArray = ["in", "ft", "yd", "m", "pm", "mm", "nm", "Mm", "mm", "cm", "dm"]
    let measurementArray = ["radius", "circumference", "diameter"]
    
    
    
    func performCalculations(length: Double, measurement: String) -> Array<Double>{
        
        let name = measurement
        switch name {
            case "circumference":
                let circumference = length //circumference is the given measurement
                let diameter: Double = length / pi //circumference divided by pi = diameter
                let radius: Double = diameter/2
                let area: Double = pow(radius, 2) * pi
                let answerArray = [radius, diameter, circumference, area]
                
                
                
                return answerArray
            case "radius":
                let radius: Double = length //radius is the given measurement
                let diameter: Double = radius * 2
                let circumference: Double = diameter * pi
                let area: Double = pow(radius, 2) * pi
                let answerArray = [radius, diameter, circumference, area]
                
                
                return answerArray
            case "diameter":
                let diameter: Double = length //given measurement
                let circumference: Double = diameter * pi
                let radius: Double = diameter/2
                let area: Double = pow(radius, 2) * pi
                
                let answerArray = [radius, diameter, circumference, area]
                return answerArray
            
            
            
            default:
                fatalError("calculation failed")
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
}
