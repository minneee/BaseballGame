//
//  main.swift
//  BaseballGame
//
//  Created by 김민희 on 8/26/25.
//

import Foundation

//게임 생성
let gameMenu = GameMenu(inputValidator: InputValidator(), numberGenerator: NumberGenerator(), gameRecordManager: GameRecordManager())
gameMenu.selectGameMenu()

