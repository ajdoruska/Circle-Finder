

import UIKit
import IQKeyboardManagerSwift
class CalculationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    //MARK: - Passed the results from the Calculations completed in CalculationLogistics
    var result: Array <Any>? //array of the answers to be passed
    
    //MARK: - Global Variables to be passed into Calculation Logistics
    var selectedMeasurement: String? // diameter, radius, circumference
    var selectedUnit: String? // unit of users choice
    var lengthmeasurement: Double? // finalMeasurement
    
    
    //MARK: - Local Variables
    private  var count: Int = 0 // assigned the number of rows given the selected picker view
    private var pickTitle: String? // help distinguish between the two pickerViews
    private var meetsGuidelines: Bool = false // declares that the form is completely filled out
    private  var unitsChanged: Bool = false // declares that there must be a selected unit
    private var measurementChanged: Bool = false // declares that there must be a selected measurement
    private var txtFieldNotNil: Bool = false // states if txtfield is blank or has value
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var length: UITextField!
    @IBOutlet weak var warningLabel: UITextView!
    @IBOutlet weak var measurementLabel: UIButton!
    @IBOutlet weak var unitLabel: UIButton!
    @IBOutlet weak var specificMeasurementScrollView: UIPickerView!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var measurmentScrollView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        measurmentScrollView.isHidden = true
        specificMeasurementScrollView.isHidden = true
        calculateButton.backgroundColor = UIColor.systemRed
        measurmentScrollView.dataSource = self
        measurmentScrollView.delegate = self
        specificMeasurementScrollView.delegate = self
        specificMeasurementScrollView.dataSource = self
        measurementLabel.setTitleColor(UIColor.systemRed, for: .normal)
        warningLabel.isHidden = true
    }
    
    @IBAction func measurementPressed(_ sender: UIButton) {
        specificMeasurementScrollView.isHidden = false //triggers the specific measurement scroll view to appear (radius, diameter, circumference)
    }
    @IBAction func unitsPressed(_ sender: UIButton) {
        measurmentScrollView.isHidden = false // triggers the unit options scroll view to appear (inches, centimeters, etc.)
    }
    
    //MARK: - measurement protocols and functions
    let calculationInfo = CalculationLogistics()
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //defines the number of rows based on which pickerView is to appear
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == measurmentScrollView {
            count = calculationInfo.unitArray.count
        }else if pickerView == specificMeasurementScrollView {
            count = calculationInfo.measurementArray.count
        }
        return count
    }
    
    //determines which array to grab information from to display in the scrollview
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == measurmentScrollView{
            pickTitle = calculationInfo.unitArray[row]
        }else if pickerView == specificMeasurementScrollView {
            pickTitle = calculationInfo.measurementArray[row]
        }
        return pickTitle
    }
    
    //determines which row and from which picker was selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == measurmentScrollView{
            selectedUnit = calculationInfo.unitArray[row]
            measurmentScrollView.isHidden = true
            unitLabel.setTitle(selectedUnit, for: .normal)
            unitsChanged = true
        }else if pickerView == specificMeasurementScrollView{
            selectedMeasurement = calculationInfo.measurementArray[row]
            specificMeasurementScrollView.isHidden = true
            measurementLabel.setTitle(selectedMeasurement, for: .normal)
            measurementLabel.setTitleColor(UIColor.black, for: .normal)
            measurementChanged = true
        }
    }
    
    //MARK: - formFilledOutCheckPoint
    //function to check that all parts of form are filled out correctly
    func formFilledChecker(){
        
        //chunk of code checks to make sure length textfield is not nil
        if let value = Double(length.text!){
            print(value)
            lengthmeasurement = value
            txtFieldNotNil = true
            
        }else{
            //textfield is found nil
            txtFieldNotNil = false //restated just for clarity
        }
        
        //if form is filled correctly and completely, then proceed
        if measurementChanged == true, unitsChanged == true, txtFieldNotNil == true{
            print("pass!!!")//for debugging purposes
            meetsGuidelines = true //passed
        }else{
            meetsGuidelines = false //failed, try again
            print("form was not fully completed")//for debugging purposes
        }
    }
    
    //MARK: - calculation segment
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        formFilledChecker()
        if meetsGuidelines == true {
            //proceed with calculations
            result = CalculationLogistics().performCalculations(length: lengthmeasurement!, measurement: selectedMeasurement!)
        }else {
            warningLabel.isHidden = false //warns user that form is not filled completely... try again!
        }
    }
}
