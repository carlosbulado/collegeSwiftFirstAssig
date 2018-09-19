//
//  Employee.swift
//  swift_assigment_01
//
//  Created by Carlos Jose Bulado on 2018-09-08.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class Employee: IPrintable, CustomStringConvertible
{
    private var _name: String
    private var _age: Int
    private var _wayOfTransportation: Vehicle?
    var calcBirthYear: Int
    {
        return 2019 - self.Age
    }
    var calcEarnings: Double
    {
        return 1000
    }
    
    init()
    {
        self._name = String()
        self._age = 0
    }
    
    init(name: String, age: Int, wot: Vehicle?)
    {
        self._name = name
        self._age = age
        self._wayOfTransportation = wot
    }
    
    var Name: String
    {
        get { return self._name }
        set { self._name = newValue }
    }
    var Age: Int
    {
        get { return self._age }
        set { self._age = newValue }
    }
    var WayOfTransportation: Vehicle?
    {
        get { return self._wayOfTransportation }
        set { self._wayOfTransportation = newValue }
    }
    
    func printMyData() -> String {
        return "This is an instance of: \(type(of: self)) \n" +
            "Name: \(self.Name) \n" +
            "Age: \(self.Age) \n" +
            "BirthYear: \(self.calcBirthYear) \n" +
            "Earnings: \(self.calcEarnings) \n" +
            "WayOfTransportation: \n ------ \n" + (self.WayOfTransportation?.printMyData() ?? "") + " ------ \n"
    }
    
    var description: String
    {
        return self.printMyData()
    }
}
