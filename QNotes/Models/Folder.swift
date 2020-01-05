//
//  Folder.swift
//  QNotes
//
//  Created by Meir Radnovich on 02/01/2020.
//  Copyright © 2020 Meir Radnovich. All rights reserved.
//

import Foundation

enum Folder : Hashable
{
  case RecycleBin
  case Working(String)
  
  static func ==(lhs: Folder, rhs: Folder) -> Bool
  {
    switch (lhs, rhs)
    {
    case (.RecycleBin, .RecycleBin): return true
    case (.Working(let a), .Working(let b)): return a == b
    default: return false
    }
  }
  
  static let Inbox = Working("Inbox")
  
  var name: String
  {
    switch self
    {
    case .RecycleBin: return "recycle-bin-244B89E9-794E-40E6-B656-A9637DE688F0"
    case .Working(let a): return a
    }
  }
}
