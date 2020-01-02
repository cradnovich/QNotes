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
}
