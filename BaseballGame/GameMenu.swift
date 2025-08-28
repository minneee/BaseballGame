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
  let baseballGame: BaseballGame

  init(baseballGame: BaseballGame) {
    self.baseballGame = baseballGame
  }

  // 사용자 입력 (메뉴 선택)
  func selectGameMenu() {
    while true {
      print("환영합니다! 원하시는 번호를 입력해주세요")
      print("1. 게임 시작하기. 2. 게임 기록 보기  3. 게임 종료하기")

      // 사용자 입력 받기
      let readLine = readLine() ?? ""
      let option: MenuOption? = MenuOption(rawValue: readLine)

      // 입력에 따른 작업 수행
      switch option {
      case .startGame:
        baseballGame.startGame()
      case .showRecord:
        print("게임 기록보기")
      case .exit:
        print("게임을 종료합니다")
        return
      case nil:
        print("⛔️ 올바른 번호를 입력해주세요.")
      }

      // 줄바꿈
      print()
    }
  }
}
