//
//  main.swift
//  FirstCourseSecondTask
//
//  Copyright © 2017 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker


let checker = Checker()

func countcn(numbers: [Int]) -> (Int, Int){
    var c = 0
    var n = 0
    for i in numbers{
        if (i%2 == 0) {c+=1} else {n+=1}
    }
    return (c, n)
}

checker.checkFirstFunction(function: countcn)

func circlech(rbg: [Checker.Circle]) -> [Checker.Circle]{
    var res: [Checker.Circle] = []
    var white: [Checker.Circle] = []
    var black: [Checker.Circle] = []
    var blue: [Checker.Circle] = []
    var clr: Set<Checker.Color> = [Checker.Color.white]
    for i in rbg where i.color != Checker.Color.white{
        clr.insert(i.color)
    }
    for i in rbg{
        if(i.color == Checker.Color.white){
            white.append(i)
            continue
        }
        if(i.color == Checker.Color.black){
            var bl = i
            bl.radius += bl.radius
            black.append(bl)
            continue
        }
        if(i.color == Checker.Color.green){
            var gr = i
            gr.color = Checker.Color.blue
            blue.append(gr)
            continue
        }
        if(i.color == Checker.Color.blue){
            blue.append(i)
            continue
        }
    }
    res = white + black + blue
    return res
}

func doCircles(arr: [Checker.Circle]) -> [Checker.Circle] {
    var _arr = arr.filter{$0.color != Checker.Color.red}
    var _temp_white:[Checker.Circle] = []
    var _temp_blue:[Checker.Circle] = []
    for (index, element) in _arr.enumerated() {
        if element.color == Checker.Color.green {
            _arr[index].color = Checker.Color.blue
        }
        else if element.color == Checker.Color.black{
            _arr[index].radius *= 2
        }
    }
    
    _arr = _arr.filter{(el) in
        if(el.color == Checker.Color.white){
        _temp_white.append(el)
        return false
        }
        else if(el.color == Checker.Color.blue){
            _temp_blue.append(el)
            return false
        }
        else{
            return true
        }
    }

    let res = _temp_white + _arr + _temp_blue
    print(res)
    return res
}

checker.checkSecondFunction(function: circlech)

func emplr(dict: [Checker.EmployeeData]) -> [Checker.Employee]{
    var res: [Checker.Employee] = []
    
    for element in dict{
        if element.count > 3 {continue}
        guard element["company"] != nil && element["salary"] != nil && element["fullName"] != nil else {continue}
        res.append(Checker.Employee(fullName: element["fullName"]!, salary: element["salary"]!, company: element["company"]!))
    }
    return res
}

checker.checkThirdFunction(function: emplr)

func mane(list: [String]) ->[String : [String]]{
    var letterArray = [String]()
    var letSet: Set<String> = []
    var res = [String : [String]]()
    for i in list {
        if let letter = i.first {
            letterArray.append(String(letter))
        }
    }
    for i in letterArray{
        letSet.insert(i)
    }
    for i in letSet{
        var lis = res[i] ?? []
        for j in list{
            //let lett: String = String(j.first)
            if (j.first == i.first){
                lis.append(j)
            }
        }
        if(lis.count >= 2){
            lis = lis.sorted(by: >)
            res[i] = lis
        }
    }
    
    return res
}

checker.checkFourthFunction(function: mane)
