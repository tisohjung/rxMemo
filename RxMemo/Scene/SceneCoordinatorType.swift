//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by minho on 2021/04/02.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionType, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
}
