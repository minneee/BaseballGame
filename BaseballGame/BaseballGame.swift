//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 김민희 on 8/26/25.
//

class BaseballGame {
  private let inputValidator: InputValidator
  private var answerNumber = [Int]()
  private var count = 0

  init(inputValidator: InputValidator) {
    self.inputValidator = inputValidator
  }

  // 게임 시작
  func startGame() {
    let answerNumber = createNumber()
    resetCount()
    print("정답: \(answerNumber)")
    print("⚾️ 게임을 시작합니다")
    createUserGuess()
  }

  // 정답 숫자 생성
  private func createNumber() -> [Int] {
    var numbers = Array(0...9)
    numbers.shuffle()
    answerNumber = Array(numbers.prefix(3))
    if answerNumber[0] == 0 {
      answerNumber.remove(at: 0)
      answerNumber.append(numbers[3])
    }

    return answerNumber
  }

  func readCount() -> Int {
    return count
  }

  func resetCount() {
    count = 0
  }

  // 사용자 입력 (숫자 추측)
  private func createUserGuess() {
    while true {
      print("\n숫자를 입력하세요")
      count += 1

      // 사용자 입력 받기
      let input = readLine() ?? ""
      let validationResult = inputValidator.validate(input)

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
    case (3, 0):
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
