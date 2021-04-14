//
//  Memo.swift
//  RxMemo
//
//  Created by minho on 2021/03/28.
//

import Foundation
import RxDataSources // tableview and collectionview bindable data source

struct Memo: Equatable, IdentifiableType {
    var identity: String
    var content: String
    var insertDate: Date
    
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    init(original: Memo, updatedContent: String) {
        self = original
        self.content = updatedContent
    }
}
