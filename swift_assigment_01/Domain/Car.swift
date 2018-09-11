//
//  Car.swift
//  swift_assigment_01
//
//  Created by Carlos Jose Bulado on 2018-09-08.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class Car : Vehicle
{
    private var _reverseSensor: Bool
    
    override init()
    {
        self._reverseSensor = false
        super.init()
    }
    
    var ReverseSensor: Bool
    {
        get { return self._reverseSensor }
        set { self._reverseSensor = newValue }
    }
    
    override func printMyData() -> String {
        return super.printMyData() +
        "ReverseSensor: \(self.ReverseSensor) \n"
    }
    
    static func parse(_ obj: [String: Any]) -> Car
    {
        let parsin: Car = Car()
        
        parsin.Make = obj["Make"] as! String
        parsin.Plate = obj["Plate"] as! String
        parsin.CruiseControl = obj["CruiseControl"] != nil ? obj["CruiseControl"] as! Bool : false
        parsin.ActivatedCruiseControl = obj["ActivatedCruiseControl"] != nil ? obj["ActivatedCruiseControl"] as! Bool : false
        parsin.ReverseSensor = obj["ReverseSensor"] != nil ? obj["ReverseSensor"] as! Bool : false
        parsin.Radio = obj["Radio"] != nil ? obj["Radio"] as! Bool : false
        parsin.Seat = obj["Seat"] != nil ? obj["Seat"] as! TypeOfSeat : TypeOfSeat.Default
        
        return parsin
    }
}
