//
//  Note.swift
//  QNotes
//
//  Created by Meir Radnovich on 01/01/2020.
//  Copyright © 2020 Meir Radnovich. All rights reserved.
//

import Foundation

class Note : Equatable
{
  var id: String?
  var date: Date
  var title: String
  var content: String
  
  init(id: String? = nil, date: Date = Date(), title: String = "New Note", content: String = "")
  {
    self.id = id
    self.date = date
    self.title = title
    self.content = content
  }
  
  static func ==(lhs: Note, rhs: Note) -> Bool
  {
    return lhs.id == rhs.id // Just compare based on ID for simplicity. Even if a note has been edited in memory, it is still the same note.
  }
}
