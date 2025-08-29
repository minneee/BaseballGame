//
//  GameRecordManager.swift
//  BaseballGame
//
//  Created by 김민희 on 8/29/25.
//

class GameRecordManager {
  private var gameRecords = [Int]()

  func addRecords(_ count: Int) {
    gameRecords.append(count)
  }

  func showRecords() {
    print("< 게임 기록보기 >")
    guard !gameRecords.isEmpty else {
      print("❎ 기록이 없습니다.")
      return
    }

    for (index, count) in gameRecords.enumerated() {
      print("\(index + 1)번째 게임: 시도 횟수 - \(count)")
    }
  }
}
