//
//  PartTime.swift
//  swift_assigment_01
//
//  Created by Carlos Jose Bulado on 2018-09-08.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class PartTime: Employee
{
    private var _rate: Double
    private var _hoursWorked: Double
    
    override init()
    {
        self._rate = 0.0
        self._hoursWorked = 0.0
        super.init()
    }
    
    init(name: String, age: Int, wot: Vehicle?, rate: Double, hoursWorked: Double)
    {
        self._rate = rate
        self._hoursWorked = hoursWorked
        super.init(name: name, age: age, wot: wot)
    }
    
    var Rate: Double
    {
        get { return self._rate }
        set { self._rate = newValue }
    }
    var HoursWorked: Double
    {
        get { return self._hoursWorked }
        set { self._hoursWorked = newValue }
    }
    
    override func printMyData() -> String {
        return super.printMyData() +
            "Rate: \(self.Rate.Currency()) \n" +
        "HoursWorked: \(self.HoursWorked) \n"
    }
}
