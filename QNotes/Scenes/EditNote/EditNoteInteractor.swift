//
//  EditNoteInteractor.swift
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

protocol EditNoteBusinessLogic
{
  func openNote(request: EditNote.OpenNote.Request)
  //func createNote(request: EditNote.CreateNote.Request)
  func updateNote(request: EditNote.UpdateNote.Request)
  func recycleNote(request: EditNote.RecycleNote.Request)
  func deleteNote(request: EditNote.DeleteNote.Request)
}

protocol EditNoteDataStore
{
  var note: Note? { get set }
}

class EditNoteInteractor: EditNoteBusinessLogic, EditNoteDataStore
{
  var presenter: EditNotePresentationLogic?
  var worker: EditNoteWorker?
  var note: Note?
  
  // MARK: Do something
  
  func openNote(request: EditNote.OpenNote.Request)
  {
    guard let n = note else
    {
      // TODO:
      return
    }
    
    let response = EditNote.OpenNote.Response(note: n)
    presenter?.presentNoteToEdit(response: response)
  }
  
  func updateNote(request: EditNote.UpdateNote.Request)
  {
    
  }
  
  func recycleNote(request: EditNote.RecycleNote.Request)
  {
    
  }
  
  func deleteNote(request: EditNote.DeleteNote.Request)
  {
    
  }

}
