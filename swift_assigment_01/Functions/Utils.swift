//
//  Functions.swift
//  swift_assigment_01
//
//  Created by Carlos Jose Bulado on 2018-09-09.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class Utils
{
    func initJohn() -> Employee
    {
        let john: Employee = CommissionBasedPartTime()
        john.Name = "John"
        john.Age = 22
        let johnsMoto: Vehicle = Motorcycle()
        john.WayOfTransportation = johnsMoto
        johnsMoto.Make = "Harley Davidson"
        johnsMoto.Plate = "JH9980"
        johnsMoto.Seat = TypeOfSeat.Leather
        johnsMoto.CruiseControl = true
        if john is PartTime
        {
            let johnPartTime = john as! PartTime
            johnPartTime.Rate = 30
            johnPartTime.HoursWorked = 10
            if johnPartTime is CommissionBasedPartTime
            {
                let johnCommis = johnPartTime as! CommissionBasedPartTime
                johnCommis.CommissionPerc = 20
            }
        }
        
        return john
    }

    func initCindy() -> Employee
    {
        let cindy: Employee = FixedBasedPartTime()
        cindy.Name = "Cindy"
        cindy.Age = 40
        let cindyCar: Vehicle = Car()
        cindy.WayOfTransportation = cindyCar
        cindyCar.Make = "Honda"
        cindyCar.Plate = "HA1234"
        cindyCar.Seat = TypeOfSeat.Default
        cindyCar.CruiseControl = true
        cindyCar.Radio = true
        if cindy is PartTime
        {
            let cindyPartTime = cindy as! PartTime
            cindyPartTime.Rate = 30
            cindyPartTime.HoursWorked = 10
            if cindyPartTime is FixedBasedPartTime
            {
                let cindyFix = cindyPartTime as! FixedBasedPartTime
                cindyFix.FixedAmount = 40.0
            }
        }
        
        return cindy
    }

    func initMatthew() -> Employee
    {
        let matthew: Employee = Intern()
        matthew.Name = "Matthew"
        matthew.Age = 24
        if matthew is Intern
        {
            let matthewIntern = matthew as! Intern
            matthewIntern.SchoolName = "Lambton College"
        }
        
        return matthew
    }

    func RunBasicAssigment()
    {
        let john = initJohn()
        let cindy = initCindy()
        let matthew = initMatthew()
        var basicAssg = true
        
        while basicAssg
        {
            print("Basic Assigment:")
            print("1 - Print John")
            print("2 - Print Cindy")
            print("3 - Print Matthew")
            print("4 - Print Payroll")
            print("0 - Exit Basic Assigment")
            let optionSelectedBasicAssg = readLine()
            
            switch optionSelectedBasicAssg
            {
            case "0":
                print("Back to main options.....")
            case "1":
                print(john)
                break
            case "2":
                print(cindy)
                break
            case "3":
                print(matthew)
                break
            case "4":
                print("PAYROLL:")
                print("John: \t\t \(john.calcEarnings)")
                print("Cindy: \t\t \(cindy.calcEarnings)")
                print("Matthew: \t \(matthew.calcEarnings)")
                print("TOTAL: \t\t \(john.calcEarnings + cindy.calcEarnings + matthew.calcEarnings)")
                break
            case .none:
                basicAssg = false
                break
            case .some(_):
                basicAssg = false
                break
            }
            
            basicAssg = optionSelectedBasicAssg != "0"
        }
    }
    
    func HackForPath()
    {
        let cwd = FileManager.default.currentDirectoryPath
        print("script run from:\n" + cwd)
        
        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let url = URL(fileURLWithPath: "JSON.json", relativeTo: currentDirectoryURL)
        print("script at: " + url.path)
    }
    
    func LoadAssigmentFromJson()
    {
        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let url = URL(fileURLWithPath: "JSON.json", relativeTo: currentDirectoryURL)
        var totalPayroll: Double = 0.0
        
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["payroll"] as? [[String: Any]] {
                let personArray = person.compactMap {
                    switch $0["Type"] as! String
                    {
                    case "CommissionBasedPartTime":
                        var obj = CommissionBasedPartTime.parse($0)
                        print(obj)
                        totalPayroll += obj.calcEarnings
                        break
                    case "FixedBasedPartTime":
                        var obj = FixedBasedPartTime.parse($0)
                        print(obj)
                        totalPayroll += obj.calcEarnings
                        break
                    default:
                        break
                    }
                }
                
                print("TOTAL PAYROLL: \(totalPayroll)")
            }
        } catch {
            print(error)
        }
    }
}
