//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 김민희 on 8/26/25.
//

class BaseballGame {
  private var answerNumber: [Int] = []

  func startGame() {
    let answerNumber = createNumber()
    print("정답: \(answerNumber)")
    print("⚾️ 게임을 시작합니다")
    createUserGuess()
  }


  private func createNumber() -> [Int] {
    var numbers = Array(1...9)
    numbers.shuffle()
    answerNumber = Array(numbers.prefix(3))

    return answerNumber
  }

  private func createUserGuess() {
    while true {
      print("\n숫자를 입력하세요")
      let input = readLine() ?? ""
      let inputNumber = input.compactMap { $0.wholeNumberValue }

      if inputNumber.isEmpty || input.count != inputNumber.count {
        print("⛔️ 올바르지 않은 입력값입니다 (문자 입력 불가)")
      } else if inputNumber.count != 3 {
        print("⛔️ 올바르지 않은 입력값입니다 (세자리 숫자만 입력 가능)")
      } else if inputNumber.contains(0) {
        print("⛔️ 올바르지 않은 입력값입니다 (0 입력 불가)")
      } else if Set(inputNumber).count != 3 {
        print("⛔️ 올바르지 않은 입력값입니다 (중복 숫자 입력 불가)")
      } else {
        if judgeNumber(inputNumber) {
          break
        }
      }

    }
  }

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
    if strike == 3 {
      print("✅ 정답입니다!")
      return true
    } else if ball == 0 && strike == 0 {
      print("❌ Nothing")
    } else if ball == 0 {
      print("\(strike) 스트라이크")
    } else if strike == 0 {
      print("\(ball) 볼")
    } else {
      print("\(strike) 스트라이크 \(ball) 볼")
    }

    return false
  }
}
