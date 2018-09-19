//
//  FullTime.swift
//  swift_assigment_01
//
//  Created by Carlos Jose Bulado on 2018-09-08.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class FullTime: Employee
{
    private var _salary: Double
    private var _bonus: Double
    
    override init()
    {
        self._salary = 0.0
        self._bonus = 0.0
        super.init()
    }
    
    init(name: String, age: Int, wot: Vehicle?, salary: Double, bonus: Double)
    {
        self._salary = salary
        self._bonus = bonus
        super.init(name: name, age: age, wot: wot)
    }
    
    var Salary: Double
    {
        get { return self._salary }
        set { self._salary = newValue }
    }
    var Bonus: Double
    {
        get { return self._bonus }
        set { self._bonus = newValue }
    }
    
    override func printMyData() -> String {
        return super.printMyData() +
            "Salary: \(self.Salary.Currency()) \n" +
        "Bonus: \(self.Bonus.Currency()) \n"
    }
}
