//
//  GameMenu.swift
//  BaseballGame
//
//  Created by 김민희 on 8/28/25.
//

enum MenuOption: String {
  case startGame = "1"
  case showRecord = "2"
  case exit = "3"
}

class GameMenu {
  private let inputValidator: InputValidator
  private let numberGenerator: NumberGenerator
  private let gameRecordManager: GameRecordManager


  init(inputValidator: InputValidator, numberGenerator: NumberGenerator, gameRecordManager: GameRecordManager) {
    self.inputValidator = inputValidator
    self.numberGenerator = numberGenerator
    self.gameRecordManager = gameRecordManager
  }

  // 사용자 입력 (메뉴 선택)
  func selectGameMenu() {
    var isRunning = true
    while isRunning {
      print("환영합니다! 원하시는 번호를 입력해주세요")
      print("1. 게임 시작하기. 2. 게임 기록 보기  3. 게임 종료하기")

      // 사용자 입력 받기
      let readLine = readLine() ?? ""
      let option: MenuOption? = MenuOption(rawValue: readLine)

      isRunning = handleOption(option)
    }
  }

  // 입력에 따른 작업 수행
  private func handleOption(_ option: MenuOption?) -> Bool {
    switch option {
    case .startGame:
      let baseballGame = BaseballGame(inputValidator: inputValidator, numberGenerator: numberGenerator)
      baseballGame.startGame()
      gameRecordManager.addRecords(baseballGame.readCount())
    case .showRecord:
      gameRecordManager.showRecords()
    case .exit:
      print("게임을 종료합니다")
      return false
    case nil:
      print("⛔️ 올바른 번호를 입력해주세요.")
    }
    print()
    return true
  }
}
