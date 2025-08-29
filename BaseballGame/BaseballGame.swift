//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 김민희 on 8/26/25.
//

class BaseballGame {
  private let inputValidator: InputValidator
  private let numberGenerator: NumberGenerator
  private let answerNumber: [Int]
  private var guessCount = 0

  init(inputValidator: InputValidator, numberGenerator: NumberGenerator) {
    self.inputValidator = inputValidator
    self.numberGenerator = numberGenerator
    self.answerNumber = numberGenerator.create()
  }

  // 게임 시작
  func startGame() {
    print("정답: \(answerNumber)")
    print("⚾️ 게임을 시작합니다")
    createUserGuess()
  }

  func readCount() -> Int {
    return guessCount
  }

  // 사용자 입력 (숫자 추측)
  private func createUserGuess() {
    while true {
      print("\n숫자를 입력하세요")
      guessCount += 1

      // 사용자 입력 받기
      let input = readLine() ?? ""
      let validationResult = inputValidator.validate(input, numberGenerator.numbersCount)

      switch validationResult {
      case .success(let number):
        if judgeNumber(number) {
          return
        }
      case .failure(let error):
        print(error.description)
      }
    }
  }

  // 스트라이크, 볼 판별
  private func judgeNumber(_ inputNumber: [Int]) -> Bool {
    var ball = 0
    var strike = 0

    for (index, value) in inputNumber.enumerated() {
      if value == answerNumber[index] {
        strike += 1
      } else if answerNumber.contains(value) {
        ball += 1
      }
    }

    switch (strike, ball) {
    case (numberGenerator.numbersCount, 0):
      print("✅ 정답입니다!")
      return true
    case (0, 0):
      print("❌ Nothing")
    case (0, _):
      print("\(ball) 볼")
    case (_, 0):
      print("\(strike) 스트라이크")
    default:
      print("\(strike) 스트라이크 \(ball) 볼")
    }

    return false
  }
}
