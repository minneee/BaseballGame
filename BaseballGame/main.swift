//
//  main.swift
//  BaseballGame
//
//  Created by 김민희 on 8/26/25.
//

import Foundation

//게임 생성
let baseballGame = BaseballGame()
baseballGame.startGame()

print("⚾️ 게임을 시작합니다")
print("숫자를 입력하세요")

let input = readLine() ?? ""

