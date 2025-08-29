//
//  InputValidator.swift
//  BaseballGame
//
//  Created by 김민희 on 8/29/25.
//

struct InputValidator {
  func validate(_ input: String) -> Result<[Int], ValidationError> {
    do {
      let number = try convertToIntArray(input)
      try checkLength(number)
      try checkFirstNumber(number)
      try checkDuplicateNumbers(number)

      return .success(number)
    } catch let error as ValidationError {
      return .failure(error)
    } catch {
      return .failure(.otherError)
    }
  }

  private func convertToIntArray(_ input: String) throws -> [Int] {
    let inputNumber = input.compactMap { $0.wholeNumberValue }
    guard inputNumber.count == input.count else {
      throw ValidationError.notNumber
    }
    return inputNumber
  }

  private func checkLength(_ input: [Int]) throws {
    guard input.count == 3 else {
      throw ValidationError.wrongLength
    }
  }

  private func checkFirstNumber(_ input: [Int]) throws {
    guard input.first != 0 else {
      throw ValidationError.firstNumberZero
    }
  }

  private func checkDuplicateNumbers(_ input: [Int]) throws {
    guard Set(input).count == input.count else {
      throw ValidationError.duplicateNumbers
    }
  }
}
