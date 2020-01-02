//
//  EditNoteModels.swift
//  QNotes
//
//  Created by Meir Radnovich on 01/01/2020.
//  Copyright (c) 2020 Meir Radnovich. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum EditNote
{
  // MARK: Use cases
  
  enum OpenNote
  {
    struct Request
    {
    }
    struct Response
    {
      let note: Note
    }
    struct ViewModel
    {
      let title: String
      let content: String
    }
  }
  
  enum UpdateNote
  {
    struct Request
    {
      let content: String
    }
    struct Response
    {
      let note: Note?
    }
    struct ViewModel
    {
      let note: Note?
    }
  }

  enum RecycleNote
  {
    struct Request
    {
    }
    struct Response
    {
    }
    struct ViewModel
    {
    }
  }

  enum DeleteNote
  {
    struct Request
    {
    }
    struct Response
    {
    }
    struct ViewModel
    {
    }
  }

}
