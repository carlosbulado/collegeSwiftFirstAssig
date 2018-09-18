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
    static var ArrayOfEmployees: [Employee] = [Employee]()
    
    static func AddEmployee(_ employee: Employee) throws
    {
        if Utils.ArrayOfEmployees.contains(where: { $0.Name == employee.Name }) { throw UtilsError.ValueAlreadyAdded }
        
        Utils.ArrayOfEmployees.append(employee)
    }
    
    static func printAssig()
    {
        var retrn: String = String()
        var totalPayRoll: Double = 0.0
        
        for e in Utils.ArrayOfEmployees
        {
            totalPayRoll += e.calcEarnings
            retrn += "Name: \(e.Name) \n" +
            "Year of Birth: \(e.calcBirthYear) \n"
            
            if e.WayOfTransportation != nil
            {
                let wot = e.WayOfTransportation!
                retrn += "\t Make: \(wot.Make) \n" +
                    "\t Plate: \(wot.Plate) \n" +
                    "\t Cruise Control: \(wot.CruiseControl) \n" +
                    "\t Activated Cruise Control: \(wot.ActivatedCruiseControl) \n" +
                    "\t Radio: \(wot.Radio) \n" +
                    "\t Seat: \(wot.Seat) \n"
                
                if wot is Car
                {
                    retrn += "\t Reverse Sensor: \((wot as! Car).ReverseSensor) \n"
                }
                
            }
            else { retrn += "Employee has no Vehicle registered \n" }
            
            if e is CommissionBasedPartTime
            {
                retrn += "Employee is PartTime / Comissioned \n"
                let c = e as! CommissionBasedPartTime
                retrn += "\t Rate: \(c.Rate.Currency()) \n" +
                    "\t HoursWorked: \(c.HoursWorked) \n" +
                    "\t Commission: \(c.CommissionPerc)% \n" +
                    "\t Earnings: \(c.calcEarnings.Currency()) (\((c.Rate * c.HoursWorked).Currency()) + \(c.CommissionPerc)% of \((c.Rate * c.HoursWorked).Currency())) \n"
            }
            else if e is FixedBasedPartTime
            {
                retrn += "Employee is PartTime / Fixed Ammount \n"
                let c = e as! FixedBasedPartTime
                retrn += "\t Rate: \(c.Rate.Currency()) \n" +
                    "\t HoursWorked: \(c.HoursWorked) \n" +
                    "\t Fixed Ammount: \(c.FixedAmount.Currency()) \n" +
                    "\t Earnings: \(c.calcEarnings.Currency()) (\((c.Rate * c.HoursWorked).Currency()) + \(c.FixedAmount.Currency())) \n"
            }
            else if e is Intern
            {
                retrn += "Employee is Intern \n"
                let c = e as! Intern
                retrn += "\t School Name: \(c.SchoolName) \n" +
                    "\t Earnings: \(c.calcEarnings.Currency()) \n"
            }
            
            retrn += "*************************************************************************************************************************\n"
        }
        
        retrn += "TOTAL PAYROLL: \(totalPayRoll.FormattingDouble()) Canadian Dollars"
        
        print(retrn)
    }
    
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
    
    init()
    {
        do
        {
            try Utils.AddEmployee(initJohn())
            try Utils.AddEmployee(initCindy())
            try Utils.AddEmployee(initMatthew())
        }
        catch UtilsError.ValueAlreadyAdded
        {
            print("Employee already added")
        }
        catch
        {
            print(error)
        }
    }

    func RunBasicAssigment()
    {
        var basicAssg = true
        
        while basicAssg
        {
            print("Basic Assigment:")
            var numberOfEmployee: Int = 1
            for e in Utils.ArrayOfEmployees
            {
                print("\(numberOfEmployee) - Print \(e.Name)")
                numberOfEmployee += 1
            }
            print("99 - Print Payroll")
            print("0 - Exit Basic Assigment")
            let optionSelectedBasicAssg = readLine()
            
            switch optionSelectedBasicAssg
            {
            case "0":
                print("Back to main options.....")
            case "99":
                print("PAYROLL:")
                Utils.printAssig()
                break
            case .none:
                let optInt = Int(optionSelectedBasicAssg!)!
                if optInt <= Utils.ArrayOfEmployees.count
                {
                    print(Utils.ArrayOfEmployees[optInt + 1])
                }
                else
                {
                    print("There is no Employee in this position!")
                }
                break
            case .some(_):
                let optInt = Int(optionSelectedBasicAssg!)!
                if optInt <= Utils.ArrayOfEmployees.count
                {
                    print(Utils.ArrayOfEmployees[optInt - 1])
                }
                else
                {
                    print("There is no Employee in this position!")
                }
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
                let _ = person.compactMap {
                    switch $0["Type"] as! String
                    {
                    case "CommissionBasedPartTime":
                        let obj = CommissionBasedPartTime.parse($0)
                        totalPayroll += obj.calcEarnings
                        do
                        {
                            try Utils.AddEmployee(obj)
                        }
                        catch UtilsError.ValueAlreadyAdded
                        {
                            print("Employee already added")
                        }
                        catch
                        {
                            print(error)
                        }
                        break
                    case "FixedBasedPartTime":
                        let obj = FixedBasedPartTime.parse($0)
                        totalPayroll += obj.calcEarnings
                        do
                        {
                            try Utils.AddEmployee(obj)
                        }
                        catch UtilsError.ValueAlreadyAdded
                        {
                            print("Employee already added")
                        }
                        catch
                        {
                            print(error)
                        }
                        break
                    default:
                        break
                    }
                }
            }
        } catch {
            print(error)
        }
    }
    
    func SaveAssigmentToJson()
    {
        do
        {
            let john = initJohn()
            //let jsonObj = try JSONSerialization.data(withJSONObject: john, options: .prettyPrinted)
            //print(jsonObj)
        }
        catch
        {
            
            print(error)
        }
    }
}

enum UtilsError : Error
{
    case ValueAlreadyAdded
}
