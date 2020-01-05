//
//  ListNotesModels.swift
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

enum ListNotes
{
  
  struct DisplayedNote
  {
    var id: String
    var date: String
    var title: String
    //        var content: String
  }
  
  // MARK: Use cases
  
  enum FetchNote
  {
    struct Request
    {
      let id: String
    }
    struct Response
    {
      let note: Note?
    }
    struct ViewModel
    {
      
    }
  }
  
  enum FetchNotes
  {
    struct Request
    {
    }
    struct Response
    {
      let folder: Folder
      let notes: [Note]
    }
    struct ViewModel
    {
      var folderTitle: String
      var displayedNotes: [DisplayedNote]
    }
  }
  
  enum CreateNote
  {
    struct Request
    {
    }
    struct Response
    {
      var note: Note?
    }
    struct ViewModel
    {
      var displayedNote: DisplayedNote?
    }
  }
  
  enum RecycleNote
  {
    struct Request
    {
      let id: String
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
      let id: String
    }
    struct Response
    {
      
    }
    struct ViewModel
    {
      
    }
  }
  
  enum RestoreNote
  {
    struct Request
    {
      let id: String
    }
    struct Response
    {
      
    }
    struct ViewModel
    {
      
    }
  }
}