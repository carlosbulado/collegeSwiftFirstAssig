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
