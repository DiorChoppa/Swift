//
//  main.swift
//  Closures
//
//  Created by Кирилл Дворядкин on 03.07.2021.
//

import Foundation
import SwiftUI

//Замыкания 1

func counterFunc()-> (Int) -> String{
    var counter = 0
    func innerFunc(i: Int) -> String{
        counter += i //counter захвачен в замыкании
        return "running total: \(counter)"
    }
    return innerFunc
}

let closureFromFunc = counterFunc()

//print(closureFromFunc(3))
//print(closureFromFunc(3))
//print(closureFromFunc(3))

//Замыкание 2

let multiplier = 3

let anonymousClosure = {
    (anotherItemArray: Int) -> Int in
    return anotherItemArray * multiplier
}

func transform(_ value: Int, using transformator: (Int) -> Int) -> Int{
    return transformator(value)
}

transform(6, using: anonymousClosure)
