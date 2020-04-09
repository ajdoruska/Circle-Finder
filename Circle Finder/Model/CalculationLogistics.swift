

import Foundation

struct CalculationLogistics {
    
    
    //    var userInputObject : CalculationViewController?
    // instance
    
    private var pi: Double = 3.14159
    
    
    let unitArray = ["in", "ft", "yd", "m", "pm", "mm", "nm", "Mm", "mm", "cm", "dm"]
    let measurementArray = ["radius", "circumference", "diameter"]
    
    
    
    func performCalculations(length: Double, measurement: String) -> Array<Any>{
        
        let name = measurement
        switch name {
            case "circumference":
                let circumference = length //circumference is the given measurement
                let diameter: Double = length / pi //circumference divided by pi = diameter
                let radius: Double = diameter/2
                let area: Double = pow(radius, 2) * pi
                return [diameter, radius, circumference, area]
            case "radius":
                let radius: Double = length //radius is the given measurement
                let diameter: Double = radius * 2
                let circumference: Double = diameter * pi
                let area: Double = pow(radius, 2) * pi
                return [diameter, radius, circumference, area]
            case "diameter":
                let diameter: Double = length //given measurement
                let circumference: Double = diameter * pi
                let radius: Double = diameter/2
                let area: Double = pow(radius, 2) * pi
                return [diameter, radius, circumference, area]
            
            
            
            default:
                fatalError("calculation failed")
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
}
