//
//  MemoryModel.swift
//  memoriesLib
//
//  Created by Flavius Bortas on 9/10/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import Foundation

class Memory {
    var title: String
    var date: String
    var content: String
    
    init(title: String, date: String, content: String) {
        self.title = title
        self.date = date
        self.content = content
    }
}

extension Memory {
    static var allMemories: [Memory] = [Memory(title: "My first memory", date: "11/24/1994", content: "Hello world"),
                                        Memory(title: "My first bithday", date: "11/24/1995", content: "wheres my cake?"),
                                        Memory(title: "a", date: "11/11/11", content: "hi"),
                                        Memory(title: "s", date: "11/22/23", content: "future"),
                                        Memory(title: "z", date: "5/24/12", content: "z")]
}
