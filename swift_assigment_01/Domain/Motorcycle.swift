//
//  Motorcycle.swift
//  swift_assigment_01
//
//  Created by Carlos Jose Bulado on 2018-09-08.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class Motorcycle : Vehicle
{
    override init()
    {
        super.init()
    }
    
    override init(make: String, plate: String, seat: TypeOfSeat, cruiseControl: Bool, activatedCruiseControl: Bool, radio: Bool)
    {
        super.init(make: make, plate: plate, seat: seat, cruiseControl: cruiseControl, activatedCruiseControl: activatedCruiseControl, radio: radio)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    static func parse(_ obj: [String: Any]) -> Motorcycle
    {
        let parsin: Motorcycle = Motorcycle()
        
        parsin.Make = obj["Make"] as! String
        parsin.Plate = obj["Plate"] as! String
        parsin.CruiseControl = obj["CruiseControl"] != nil ? obj["CruiseControl"] as! Bool : false
        parsin.ActivatedCruiseControl = obj["ActivatedCruiseControl"] != nil ? obj["ActivatedCruiseControl"] as! Bool : false
        parsin.Radio = obj["Radio"] != nil ? obj["Radio"] as! Bool : false
        parsin.Seat = obj["Seat"] != nil ? obj["Seat"] as! TypeOfSeat : TypeOfSeat.Default
        
        return parsin
    }
}
