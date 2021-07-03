//
//  main.swift
//  MemotyControl
//
//  Created by Кирилл Дворядкин on 03.07.2021.
//

import Foundation

//Ссылки на объекты

class TestClass{
    init(){
        print("TestClass создан")
    }
    
    deinit{
        print("TestClass удален")
    }
}

var reference1: TestClass? = TestClass()
var reference2 = reference1 //2 references

reference1 = nil //1 reference
reference2 = nil //0 references

//Reference cycle

class User{
    let name: String
    var devices: [Device]
    
    init(name: String){
        self.name = name
        devices = []
        
        print("Создан пользователь: \(name)")
    }
}

class Device{
    let model: String
    let owner: User
    
    init(model: String, owner: User){
        self.model = model
        self.owner = owner
        
        print("Создано устройство: \(model). Его владелец: \(owner.name)")
    }
}

var bob: User? = User(name: "Bob")
var iPhone7: Device? = Device(model: "iPhone7", owner: bob!)

bob!.devices.append(iPhone7!)

bob = nil
iPhone7 = nil

//Weak reference

class User1{
    let name: String
    var devices: [Device1]
    
    init(name: String){
        self.name = name
        devices = []
        
        print("Создан пользователь: \(name)")
    }
    
    deinit{
        print("Удален пользователь: \(name)")
    }
}

class Device1{
    let model: String
    let owner: User
    
    init(model: String, owner: User){
        self.model = model
        self.owner = owner
        
        print("Создано устройство: \(model). Его владелец: \(owner.name)")
    }
    
    deinit{
        print("Удалено устройство: \(model)")
    }
}

//Reference cycle

class Cnt{
    var value: Int = 0
    lazy var valueChanger={
        [unowned self] in
        self.value += 1
    }
    deinit{
        print("Counter удален")
    }
}

var counter: Cnt?=Cnt()
counter = nil
