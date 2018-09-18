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
    private var _reverseSensor: Bool!
    
    private enum CodingKeys : String, CodingKey {
        case _reverseSensor = "ReverseSensor"
    }
    
    override init()
    {
        self._reverseSensor = false
        super.init()
    }
    
    init(make: String, plate: String, seat: TypeOfSeat, cruiseControl: Bool, activatedCruiseControl: Bool, radio: Bool, reverseSensor: Bool)
    {
        self._reverseSensor = reverseSensor
        super.init(make: make, plate: plate, seat: seat, cruiseControl: cruiseControl, activatedCruiseControl: activatedCruiseControl, radio: radio)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        try super.init(from: decoder)

        let reverseSensor = try container.decode(Bool.self, forKey: ._reverseSensor)
        self._reverseSensor = reverseSensor
    }
    
    override func encode(to encoder: Encoder) throws
    {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(_reverseSensor, forKey: ._reverseSensor)
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
