//
//  Vehicle.swift
//  swift_assigment_01
//
//  Created by Carlos Jose Bulado on 2018-09-08.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class Vehicle: IPrintable, CustomStringConvertible
{
    private var _make: String
    private var _plate: String
    private var _seat: TypeOfSeat
    private var _cruiseControl: Bool
    private var _activatedCruiseControl: Bool
    private var _radio: Bool
    
    init()
    {
        self._make = String()
        self._plate = String()
        self._seat = TypeOfSeat.Default
        self._cruiseControl = false
        self._activatedCruiseControl = false
        self._radio = false
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

