//
//  CommissionBasedPartTime.swift
//  swift_assigment_01
//
//  Created by Carlos Jose Bulado on 2018-09-08.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class CommissionBasedPartTime: PartTime
{
    private var _commissionPerc: Double
    override var calcEarnings: Double
    {
        return (self.Rate * self.HoursWorked) + (self.Rate * self.HoursWorked * self.CommissionPerc / 100)
    }
    
    override init()
    {
        self._commissionPerc = 0.0
        super.init()
    }
    
    var CommissionPerc: Double
    {
        get { return self._commissionPerc }
        set { self._commissionPerc = newValue }
    }
    
    override func printMyData() -> String {
        return super.printMyData() +
        "CommissionPerc: \(self.CommissionPerc) \n"
    }
    
    static func parse(_ obj: [String: Any]) -> CommissionBasedPartTime
    {
        let parsin: CommissionBasedPartTime = CommissionBasedPartTime()
        
        parsin.Name = obj["Name"] as! String
        parsin.Age = obj["Age"] != nil ? Int((obj["Age"] as! NSString).floatValue) : 0
        parsin.Rate = obj["Rate"] != nil ? Double((obj["Rate"] as! NSString).floatValue) : 0.0
        parsin.HoursWorked = obj["HoursWorked"] != nil ? Double((obj["HoursWorked"] as! NSString).floatValue) : 0.0
        parsin.CommissionPerc = obj["CommissionPerc"] != nil ? Double((obj["CommissionPerc"] as! NSString).floatValue) : 0.0
        
        if obj["WayOfTransportation"] != nil
        {
            let transport: [String: Any] = obj["WayOfTransportation"] as! [String: Any]
            let typeOfWayOfTransportation: String = transport["Type"] as! String
            switch typeOfWayOfTransportation
            {
            case "Car":
                parsin.WayOfTransportation = Car.parse(transport)
                break
            case "Motorcycle":
                parsin.WayOfTransportation = Motorcycle.parse(transport)
                break
            default:
                break
            }
        }
        
        return parsin
    }
}
