//
//  InputValidatable.swift
//  BaseballGame
//
//  Created by 김민희 on 9/3/25.
//

protocol InputValidatable {
  func validate(_ input: String, _ numbersCount: Int) -> Result<[Int], ValidationError>
}
