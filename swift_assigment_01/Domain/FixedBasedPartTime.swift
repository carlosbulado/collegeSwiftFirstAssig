//
//  FixedBasedPartTime.swift
//  swift_assigment_01
//
//  Created by Carlos Jose Bulado on 2018-09-08.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class FixedBasedPartTime: PartTime
{
    private var _fixedAmount: Double
    override var calcEarnings: Double
    {
        return (self.Rate * self.HoursWorked) + self.FixedAmount
    }
    
    override init()
    {
        self._fixedAmount = 0.0
        super.init()
    }
    
    init(name: String, age: Int, wot: Vehicle?, rate: Double, hoursWorked: Double, fixed: Double)
    {
        self._fixedAmount = fixed
        super.init(name: name, age: age, wot: wot, rate: rate, hoursWorked: hoursWorked)
    }
    
    var FixedAmount: Double
    {
        get { return self._fixedAmount }
        set { self._fixedAmount = newValue }
    }
    
    override func printMyData() -> String {
        return super.printMyData() +
        "FixedAmount: \(self.FixedAmount.Currency()) \n"
    }
    
    static func parse(_ obj:[String: Any]) -> FixedBasedPartTime
    {
        let parsin: FixedBasedPartTime = FixedBasedPartTime()
        
        parsin.Name = obj["Name"] as! String
        parsin.Age = obj["Age"] != nil ? Int((obj["Age"] as! NSString).floatValue) : 0
        parsin.Rate = obj["Rate"] != nil ? Double((obj["Rate"] as! NSString).floatValue) : 0.0
        parsin.HoursWorked = obj["HoursWorked"] != nil ? Double((obj["HoursWorked"] as! NSString).floatValue) : 0.0
        parsin.FixedAmount = obj["FixedAmount"] != nil ? Double((obj["FixedAmount"] as! NSString).floatValue) : 0.0
        
        return parsin
    }
}
