//
//  Vehicle.swift
//  swift_assigment_01
//
//  Created by Carlos Jose Bulado on 2018-09-08.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class Vehicle: IPrintable, Codable, CustomStringConvertible
{
    private var _make: String
    private var _plate: String
    private var _seat: TypeOfSeat
    private var _cruiseControl: Bool
    private var _activatedCruiseControl: Bool
    private var _radio: Bool
    
    private enum CodingKeys : String, CodingKey {
        case _make = "Make"
        case _plate = "Plate"
        case _seat = "Seat"
        case _cruiseControl = "CruiseControl"
        case _activatedCruiseControl = "ActivatedCruiseControl"
        case _radio = "Radio"
    }
    
    init()
    {
        self._make = String()
        self._plate = String()
        self._seat = TypeOfSeat.Default
        self._cruiseControl = false
        self._activatedCruiseControl = false
        self._radio = false
    }
    
    init(make: String, plate: String, seat: TypeOfSeat, cruiseControl: Bool, activatedCruiseControl: Bool, radio: Bool)
    {
        self._make = make
        self._plate = plate
        self._seat = seat
        self._cruiseControl = cruiseControl
        self._activatedCruiseControl = activatedCruiseControl
        self._radio = radio
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let make = try container.decode(String.self, forKey: ._make)
        let plate = try container.decode(String.self, forKey: ._plate)
        let seat = try container.decode(TypeOfSeat.self, forKey: ._seat)
        let cruiseControl = try container.decode(Bool.self, forKey: ._cruiseControl)
        let activatedCruiseControl = try container.decode(Bool.self, forKey: ._activatedCruiseControl)
        let radio = try container.decode(Bool.self, forKey: ._radio)
        self._make = make
        self._plate = plate
        self._seat = seat
        self._cruiseControl = cruiseControl
        self._activatedCruiseControl = activatedCruiseControl
        self._radio = radio
    }
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(_make, forKey: ._make)
        try container.encode(_plate, forKey: ._plate)
        try container.encode(_seat, forKey: ._seat)
        try container.encode(_cruiseControl, forKey: ._cruiseControl)
        try container.encode(_activatedCruiseControl, forKey: ._activatedCruiseControl)
        try container.encode(_radio, forKey: ._radio)
    }
    
    var Make: String
    {
        get { return self._make }
        set { self._make = newValue }
    }
    var Plate: String
    {
        get { return self._plate }
        set { self._plate = newValue }
    }
    var Seat: TypeOfSeat
    {
        get { return self._seat }
        set { self._seat = newValue }
    }
    var CruiseControl: Bool
    {
        get { return self._cruiseControl }
        set { self._cruiseControl = newValue }
    }
    var ActivatedCruiseControl: Bool
    {
        get { return self._activatedCruiseControl }
        set { self._activatedCruiseControl = newValue }
    }
    var Radio: Bool
    {
        get { return self._radio }
        set { self._radio = newValue }
    }
    
    func printMyData() -> String {
        return "This is an instance of: \(type(of: self)) \n" +
            "Make: \(self.Make) \n" +
            "Plate: \(self.Plate) \n" +
            "Seat: \(self.Seat) \n" +
            "CruiseControl: \(self.CruiseControl) \n" +
            "ActivatedCruiseControl: \(self.ActivatedCruiseControl) \n" +
        "Radio: \(self.Radio) \n"
    }
    
    var description: String
    {
        return self.printMyData()
    }
}

