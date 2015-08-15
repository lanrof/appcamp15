//
//  InterfaceController.swift
//  Maps WatchKit Extension
//
//  Created by Appcamp on 26/07/15.
//  Copyright (c) 2015 Appcamp. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var map: WKInterfaceMap!
    
    @IBOutlet weak var slider: WKInterfaceSlider!
    
    var zoom : Float = 0.1
    var maxZoom : Float = 10.0
    
    var coordX = 54.44321
    var coordY = 18.5600
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        slider.setValue(maxZoom * 10)
        
        let location = CLLocationCoordinate2D(latitude: 54.44321, longitude: 18.5600)
        let span = MKCoordinateSpan(latitudeDelta: Double(maxZoom), longitudeDelta: Double(maxZoom))
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        
        map.setRegion(region)
        map.addAnnotation(location, withPinColor: WKInterfaceMapPinColor.Red)
        
        
        
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    @IBAction func mapResize(value: Float) {
        zoom = value
        
        let location = CLLocationCoordinate2D(latitude: self.coordX, longitude: self.coordY)
        let span = MKCoordinateSpan(latitudeDelta: Double(maxZoom - zoom / 10), longitudeDelta: Double(maxZoom - zoom / 10))
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        
        map.setRegion(region)
        map.addAnnotation(location, withPinColor: WKInterfaceMapPinColor.Red)
        
        
        slider.setValue(zoom)
    }
    
    
    @IBAction func GetNewCoordinates() {
        
        
        WKInterfaceController.openParentApplication(["Coordinates" : "get coordinates"], reply: { (reply, error) -> Void in
            
            if let responseMessage = reply as? [String : Double], coordX = responseMessage["CoordinateX"], coordY = responseMessage["CoordinateY"] {
                //println(responseMessage)
                //self.messageLabel.setText(responseMessage)
                
                self.coordX = coordX
                self.coordY = coordY
            }
        })
        
        let location = CLLocationCoordinate2D(latitude: self.coordX, longitude: self.coordY)
        let span = MKCoordinateSpan(latitudeDelta: Double(maxZoom - zoom / 10), longitudeDelta: Double(maxZoom - zoom / 10))
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        
        map.setRegion(region)
        map.addAnnotation(location, withPinColor: WKInterfaceMapPinColor.Red)
        
        
        slider.setValue(zoom)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
