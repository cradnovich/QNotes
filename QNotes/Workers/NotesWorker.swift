//
//  NotesWorker.swift
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

class NotesWorker
{
  var notesStore: NotesStoreProtocol
  
  init(store: NotesStoreProtocol)
  {
    notesStore = store
  }
  
  func restoreNote(noteToRestore: Note, completionHandler: @escaping (Note?) -> Void)
  {
    notesStore.restoreNote(noteToRestore: noteToRestore) { (result: Result<Note, QNotesError>) -> Void in
      switch result
      {
      case let .success(n):
        DispatchQueue.main.async {
          completionHandler(n)
        }
      case .failure:
        DispatchQueue.main.async {
          completionHandler(nil)
        }
      }
    }
  }
  
  func recycleNote(noteToRecycle: Note, in folder: Folder, completionHandler: @escaping (Note?) -> Void)
  {
    notesStore.recycleNote(noteToRecycle: noteToRecycle) { (result: Result<Note, QNotesError>) -> Void in
      switch result
      {
      case let .success(n):
        DispatchQueue.main.async {
          completionHandler(n)
        }
      case .failure:
        DispatchQueue.main.async {
          completionHandler(nil)
        }
      }
    }
  }
  
  func deleteNote(id: String, completionHandler: @escaping (Note?) -> Void)
  {
    notesStore.deleteNote(id: id) { (result: Result<Note?, QNotesError>) in
      switch result
      {
      case let .success(n):
        DispatchQueue.main.async {
          completionHandler(n)
        }
      case .failure:
        DispatchQueue.main.async {
          completionHandler(nil)
        }
      }
    }
  }
  
  func createNote(noteToCreate: Note, in folder: Folder, completionHandler: @escaping (Note?) -> Void)
  {
    notesStore.createNote(noteToCreate: noteToCreate, in: folder) { (result: Result<Note, QNotesError>) -> Void in
      switch result
      {
      case let .success(note):
        DispatchQueue.main.async {
          completionHandler(note)
        }
//      case let .failure(error):
      case .failure:
        DispatchQueue.main.async {
          completionHandler(nil)
        }
      }
    }
  }
  
  func updateNote(noteToUpdate: Note, in folder: Folder, completionHandler: @escaping (Note?) -> Void)
  {
    notesStore.updateNote(noteToUpdate: noteToUpdate, in: folder) { (result: Result<Note, QNotesError>) -> Void in
      switch result
      {
      case let .success(note):
        DispatchQueue.main.async {
          completionHandler(note)
        }
      //      case let .failure(error):
      case .failure:
        DispatchQueue.main.async {
          completionHandler(nil)
        }
      }
    }
  }

  func fetchNotes(in folder: Folder, completionHandler: @escaping ([Note]) -> Void)
  {
    notesStore.fetchNotes(in: folder) { (result: Result<[Note], QNotesError>) -> Void in
      
      switch result
      {
      case let .success(notes):
        DispatchQueue.main.async {
          completionHandler(notes)
        }
      //case let .failure(error):
      case .failure:
        DispatchQueue.main.async {
          // Pass the result?
          completionHandler([])
        }
      }
    }
  }
  
  func emptyRecycleBin(completionHandler: @escaping (Bool) -> Void)
  {
    notesStore.emptyRecycleBin { (result: Result<Void, QNotesError>) -> Void in
      switch result
      {
      case .success:
        DispatchQueue.main.async {
          completionHandler(true)
        }
      case .failure:
        DispatchQueue.main.async {
          completionHandler(false)
        }
      }
    }
  }
}
