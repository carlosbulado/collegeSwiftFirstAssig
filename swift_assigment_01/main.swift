//
//  main.swift
//  swift_assigment_01
//
//  Created by Carlos Jose Bulado on 2018-09-08.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

print("Welcome to the Assigment #1!")

var continueProgram: Bool = true
var ut:Utils = Utils()

while continueProgram
{
    print("What do you want to do? (Type the number to select an action)")
    print("1 - Run the basic assigment")
    print("2 - Read assigment from JSON file")
    print("0 - Exit")
    let optionSelected = readLine()
    
    switch optionSelected
    {
    case "0":
        print("Exiting....")
        break
    case "1":
        ut.RunBasicAssigment()
        break
    case "2":
        ut.LoadAssigmentFromJson()
        break
    case .none:
        continueProgram = optionSelected != "0"
        break
    case .some(_):
        continueProgram = optionSelected != "0"
        break
    }
    
    continueProgram = optionSelected != "0"
}

