//
//  TransitionModel.swift
//  RxMemo
//
//  Created by minho on 2021/04/02.
//

import Foundation

enum TransitionType {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
