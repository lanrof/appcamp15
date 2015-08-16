//
//  ViewController.swift
//  healthKitTest
//
//  Created by Appcamp on 16/08/15.
//  Copyright (c) 2015 Appcamp. All rights reserved.
//

import UIKit
import HealthKit


class ViewController: UIViewController {

    @IBOutlet weak var biologicalSexLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightLabel: UILabel!
    
    let healthStore : HKHealthStore? = {
        if HKHealthStore.isHealthDataAvailable(){
            return HKHealthStore()
        }
        else {
            return nil
        }
    }()
    
    func requestAccessToHealthData() {
        let dataTypesToWrite = NSSet(object: HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass))
        
        let dataTypesToRead = NSSet(objects: HKCharacteristicType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBiologicalSex), HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight), HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass) )
        
        if healthStore != nil {
            healthStore?.requestAuthorizationToShareTypes(dataTypesToWrite as Set<NSObject>, readTypes: dataTypesToRead as Set<NSObject>) {
                (success, error) -> Void in
                if success {
                    println("Success")
                }
                else {
                    println(error.description)
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestAccessToHealthData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func GetHealthKitData(sender: AnyObject) {
        
        if healthStore != nil {
            var error : NSError? = NSError()
            var biologicalSexObject = healthStore!.biologicalSexWithError(&error)!.biologicalSex
            println(biologicalSexObject)
            
            var biologicalSex = " "
            switch biologicalSexObject {
                case .Female : biologicalSex = "Female"
                case .Male : biologicalSex = "Male"
                case .NotSet : biologicalSex = "Not set"
                case .Other : biologicalSex = "Other"
            }
            
            biologicalSexLabel.text = biologicalSex
        }
        
        var sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let heightSampleQuery = HKSampleQuery(sampleType: HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight), predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) {
            
            (query, results, error) in
            
            if let mostRecentSample = results.first as? HKQuantitySample {
                let unit = HKUnit(fromString: "m")
                let value = mostRecentSample.quantity.doubleValueForUnit(unit)
                
                dispatch_sync(dispatch_get_main_queue(),  { () -> Void in self.heightLabel.text = "\(value)\(unit)"
                })
                
            }
        }
        
        healthStore?.executeQuery(heightSampleQuery)
        
        //odczyt wagi
        let weightSampleQuery = HKSampleQuery(sampleType: HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass), predicate: nil, limit: 1, sortDescriptors: [sortDescriptor] ) {
            (query, result, error) in
            
            if let mostRecentSimpleWeight = result.first as? HKQuantitySample {
                let unit = HKUnit(fromString: "kg")
                let value = mostRecentSimpleWeight.quantity.doubleValueForUnit(unit)
                
                dispatch_sync(dispatch_get_main_queue(), { () -> Void in self.weightLabel.text = "\(value)\(unit)"
                })
            }
        }
        healthStore?.executeQuery(weightSampleQuery)
        
    }
    
    func saveData() {
        var weight = (weightTextField.text as NSString).doubleValue
        
        var unit = HKUnit(fromString: "kg")
        var quantity = HKQuantity(unit: unit, doubleValue: weight)
        var weightType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
        
        var bodyMass = HKQuantitySample(type: weightType, quantity: quantity!, startDate: NSDate(), endDate: NSDate())
        
        
        healthStore?.saveObject(bodyMass, withCompletion: {
            (success, error) -> Void in
            if success {
                println("data saved")
            }
            else {
                println(error.description)
            }
            
        })
        
    }
    //pozwolenie na zapis i odczyt danych - wagi
    //dodajemy pole textfield , w save data tworzymy probke typu weight (tak jak HKQuanttityType Weight i wrzucamy do saveobject
    
    @IBAction func SetWeightData(sender: AnyObject) {
        saveData()
        
    }
    
    
    
    
    
    
    
    

    
    
}








