//
//  ValidationError.swift
//  BaseballGame
//
//  Created by 김민희 on 8/29/25.
//


enum ValidationError: Error {
  case notNumber
  case wrongLength(count: Int)
  case firstNumberZero
  case duplicateNumbers
  case otherError

  var description: String {
    switch self {
    case .notNumber:
      "⛔️ 올바르지 않은 입력값입니다 (문자 입력 불가)"
    case .wrongLength(let count):
      "⛔️ 올바르지 않은 입력값입니다 (숫자 \(count)개만 입력 가능)"
    case .firstNumberZero:
      "⛔️ 올바르지 않은 입력값입니다 (첫번째 자리에 0 입력 불가)"
    case .duplicateNumbers:
      "⛔️ 올바르지 않은 입력값입니다 (중복 숫자 입력 불가)"
    case .otherError:
      "⛔️ 올바르지 않은 입력값입니다"
    }
  }
}
