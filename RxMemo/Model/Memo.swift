//
//  Memo.swift
//  RxMemo
//
//  Created by minho on 2021/03/28.
//

import Foundation

struct Memo: Equatable {
    var id: String
    var content: String
    var insertDate: Date
    
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.id = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    init(original: Memo, updatedContent: String) {
        self = original
        self.content = updatedContent
    }
}
