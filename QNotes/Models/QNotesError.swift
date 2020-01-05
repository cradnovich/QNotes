//
//  QNotesError.swift
//  QNotes
//
//  Created by Meir Radnovich on 05/01/2020.
//  Copyright © 2020 Meir Radnovich. All rights reserved.
//

import Foundation

enum QNotesError : Error
{
  case noteNotFound(String)
  case fileNotFound(URL)
  case untitledNote
  case systemError(Error)
  case fileUnreadable(URL)
  case encodingFailure(String)
  case restoringFailure(String)
  case recyclingFailure(String)
  case deletionFailure(String)
  case updatingFailure(String)
}
