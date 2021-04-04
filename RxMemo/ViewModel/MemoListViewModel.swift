//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by minho on 2021/03/28.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel {
    var memoList: Observable<[Memo]> {
        return storage.memoList()
    }
}
