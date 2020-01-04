//
//  ListNotesInteractor.swift
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

protocol ListNotesBusinessLogic
{
  func fetchNotes(request: ListNotes.FetchNotes.Request)
}

protocol ListNotesDataStore
{
  var folder: Folder { get set }
  var notes: [Note]? { get }
}

class ListNotesInteractor: ListNotesBusinessLogic, ListNotesDataStore
{
  var presenter: ListNotesPresentationLogic?
  var folder = Folder.Inbox
  var worker = ListNotesWorker(store: NotesFileStore())
  var notes: [Note]?
  
  // MARK: Do something
  
  func fetchNotes(request: ListNotes.FetchNotes.Request)
  {
    worker.fetchNotes(in: folder) { (notes: [Note]) in
      self.notes = notes

      let response = ListNotes.FetchNotes.Response(folder: self.folder, notes: notes)
      self.presenter?.presentFetchedNotes(response: response)
    }
  }
}
