//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 김민희 on 8/26/25.
//

class BaseballGame {
  func startGame() {
    let answerNumber = createNumber()
    print("정답은: \(answerNumber)")
  }


  func createNumber() -> [Int] {
    var numbers = Array(1...9)
    numbers.shuffle()
    let answerNumber = Array(numbers.prefix(3))

    return answerNumber
  }
}
