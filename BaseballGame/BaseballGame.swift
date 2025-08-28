//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 김민희 on 8/26/25.
//

class BaseballGame {
  private var answerNumber = [Int]()
  var count = 0

  // 게임 시작
  func startGame() {
    let answerNumber = createNumber()
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

  // 사용자 입력 (숫자 추측)
  private func createUserGuess() {
    while true {
      print("\n숫자를 입력하세요")
      count += 1

      // 사용자 입력 받기
      let input = readLine() ?? ""
      let inputNumber = input.compactMap { $0.wholeNumberValue }

      // 입력 값에 따른 작업 수행
      if inputNumber.isEmpty || input.count != inputNumber.count {
        print("⛔️ 올바르지 않은 입력값입니다 (문자 입력 불가)")
      } else if inputNumber.count != 3 {
        print("⛔️ 올바르지 않은 입력값입니다 (세자리 숫자만 입력 가능)")
      } else if inputNumber[0] == 0 {
        print("⛔️ 올바르지 않은 입력값입니다 (첫번째 자리에 0 입력 불가)")
      } else if Set(inputNumber).count != 3 {
        print("⛔️ 올바르지 않은 입력값입니다 (중복 숫자 입력 불가)")
      } else {
        if judgeNumber(inputNumber) {
          break
        }
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
