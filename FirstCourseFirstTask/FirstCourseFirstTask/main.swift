//
//  main.swift
//  FirstCourseFirstTask
//
//  Copyright © 2017 E-Legion. All rights reserved.
//

// Импортируем необходимые модули
import Foundation
import FirstCourseFirstTaskChecker


// Создаем экземпляр класса Checker для вызова проверок
let checker = Checker()


// Для получения первой части кодового слова вам нужно реализовать простую функцию. Она
// не принимает никаких параметров и просто возвращает строку "Hello, world!" (без кавычек).

func firstFunction() -> String {
    return "Hello, world!"
}

// Передача функции на проверку
checker.checkFirstFunction(function: firstFunction)


// Для получения следующей части кодового слова вам нужно реализовать функцию, принимающую
// на вход два целых числа в виде строки и возвращающую результат их сложения в виде Int.
// Для конвертации строки в число воспользуйтесь инициализатором Int(String)! Восклицательный знак
// используется только потому, что мы знаем, что Checker не будет передавать некорректную строку и
// преобразование в Int всегда завершится успешно. В реальных проектах такой код использовать не
// следует. Более подробная информация об Optionals представлена в одноименной лекции.

func secondFunction(lhs: String, rhs: String) -> Int {
    return Int(lhs)! + Int(rhs)!
}

// Передача второй функции на проверку
checker.checkSecondFunction(function: secondFunction)


// Для получения последней части кодового слова вам нужно реализовать еще одну функцию.
// Чтобы узнать требования к ней нажмите левой кнопкой мыши на метод checkThirdFunction с
// зажатой клавишей cmd и переместитесь к его определению. Для преобразования данных в строку
// можно воспользоваться инициализатором String(describing: Any). Эта инициализация всегда
// заканчивается успешно. Поэтому не нужно использовать восклицательный знак.

func thirdFunction(_ currency: Checker.Currency, _ amount: Int) -> String {
    //amount > 0? return String(amount + " " + currency) : return String(+amount + " " + currency)
    //var test = Checker.Currency.currency
    
    var qur = ""
    
    //var val = "\(currency)"
    switch currency{
    case Checker.Currency.rub:
        qur = "₽"
        //qur = Checker.Currency.rub
        //print (qur)
    case Checker.Currency.eur:
        qur = "€"
        //qur = Checker.Currency.eur
        //print (qur)
    case Checker.Currency.usd:
        qur = "$"
        //qur = Checker.Currency.usd
        //print (qur)
    default:
        print("Wrong \(currency)")
    }
    
    
    
    //return val
    
    if amount >= 0 {
        var result = "\(amount) \(qur)"
        return result
    }
    else{
        var inversion = amount - 2*amount
        var result = "(\(inversion)) \(qur)"
        return result
    }
    
}

// Передача третьей функции на проверку
checker.checkThirdFunction(function: thirdFunction)
