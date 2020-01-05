//
//  Note.swift
//  QNotes
//
//  Created by Meir Radnovich on 01/01/2020.
//  Copyright © 2020 Meir Radnovich. All rights reserved.
//

import Foundation

struct Note : Equatable
{
  var id: String?
  var date = Date()
  var title = "New Note"
  var content = ""
  
  static func ==(lhs: Note, rhs: Note) -> Bool
  {
    return lhs.id == rhs.id // Just compare based on ID for simplicity. Even if a note has been edited in memory, it is still the same note.
  }
}
