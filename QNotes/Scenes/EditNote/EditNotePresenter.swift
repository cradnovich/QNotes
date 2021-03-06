//
//  EditNotePresenter.swift
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

protocol EditNotePresentationLogic
{
  func presentNoteToEdit(response: EditNote.OpenNote.Response)
  func presentUpdatedNote(response: EditNote.UpdateNote.Response)
  
  // Don't actually present anything, just pop the view...
  func presentRecycledNote(response: EditNote.RecycleNote.Response)
  func presentDeletedNote(response: EditNote.DeleteNote.Response)
  func presentRestoredNote(response: EditNote.RestoreNote.Response)
}

class EditNotePresenter: EditNotePresentationLogic
{
  weak var viewController: EditNoteDisplayLogic?
  
  // MARK: Do something
  
  func presentNoteToEdit(response: EditNote.OpenNote.Response)
  {
    let viewModel = EditNote.OpenNote.ViewModel(title: response.note.title, content: response.note.content)
    viewController?.displayNoteToEdit(viewModel: viewModel)
  }
  
  func presentUpdatedNote(response: EditNote.UpdateNote.Response)
  {
    let viewModel = EditNote.UpdateNote.ViewModel(note: response.note)
    viewController?.displayUpdatedNote(viewModel: viewModel)
  }
  
  // MARK: Do nothing
  func presentRecycledNote(response: EditNote.RecycleNote.Response)
  {
    //    let viewModel = EditNote.RecycleNote.ViewModel()
    //    viewController?.displayRecycledNote(viewModel: viewModel)
  }
  
  func presentDeletedNote(response: EditNote.DeleteNote.Response)
  {
    //    let viewModel = EditNote.DeleteNote.ViewModel()
    //    viewController?.displayDeletedNote(viewModel: viewModel)
  }
  
  func presentRestoredNote(response: EditNote.RestoreNote.Response)
  {
    //    let viewModel = EditNote.RestoreNote.ViewModel()
    //    viewController?.displayRestoredNote(viewModel: viewModel)
  }
}
