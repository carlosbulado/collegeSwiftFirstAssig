//
//  Intern.swift
//  swift_assigment_01
//
//  Created by Carlos Jose Bulado on 2018-09-08.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class Intern: Employee
{
    private var _schoolName: String
    
    override init()
    {
        self._schoolName = String()
        super.init()
    }
    
    var SchoolName: String
    {
        get { return self._schoolName }
        set { self._schoolName = newValue }
    }
    
    override func printMyData() -> String {
        return super.printMyData() +
        "SchoolName: \(self.SchoolName) \n"
    }
}
