//
//  NumberGenerator.swift
//  BaseballGame
//
//  Created by 김민희 on 8/29/25.
//

struct NumberGenerator: NumberGeneratable {
  func create(_ numbersCount: Int) -> [Int] {
    let firstNumber = Int.random(in: 1...9)
    let numbers = Array(0...9)
      .filter { $0 != firstNumber }
      .shuffled()
      .prefix(numbersCount - 1)

    return [firstNumber] + numbers
  }
}
