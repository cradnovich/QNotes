//
//  NotesMemStore.swift
//  QNotes
//
//  Created by Meir Radnovich on 05/01/2020.
//  Copyright © 2020 Meir Radnovich. All rights reserved.
//

import Foundation

class NotesMemStore : NotesStoreProtocol, NotesStoreUtilityProtocol
{
  static private var dummyData: [Folder:[Note]] = [
    Folder.Inbox:[Note(id: "abcd", date: Date(timeIntervalSince1970: 80000.9), title: "Old tyme note", content: "This is an old note from early 1970. Computers: who needs 'em, amirite?"), Note(id: "numpty", date: Date(timeIntervalSinceReferenceDate: -98765432.32), title: "Grungy", content: "The 5750s? Just guessing when this note was written."), Note(id: "even further back", date: Date(timeIntervalSince1970: -90000000.0), title: "Sorting test, should be at bottom.", content: "Here is another note for your enjoyment. However, it has no content."), Note(id: "superego", date: Date(), title: "Floater", content: "This note was just generated when you launched the app. Yay!")],
    .RecycleBin:[Note(id: "aluminum", date: Date(timeIntervalSince1970: 12345678.9), title: "Aluminum or aluminium?", content: "This can is not made of tin. Been sitting in the recycling been for a while now."), Note(id: "newspaper", date: Date(timeIntervalSinceReferenceDate: 90000.33), title: "Recyclable paper", content: "'Member newspapers?! LOL!"), Note(id: "content", date: Date(timeIntervalSinceNow: -3600 * 24.0), title: "Yesterday", content: "Troubles seemed so far away.")]
  ]
  
  func createNote(noteToCreate: Note, in folder: Folder, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  {
    var note = noteToCreate
    note.id = generateId()
    
    type(of: self).dummyData[folder]?.append(note)
    
    completionHandler(.success(note))
  }
  
  func updateNote(noteToUpdate: Note, in folder: Folder, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  {
    if var match = type(of: self).dummyData[folder]?.first(where: {noteToUpdate.id == $0.id})
    {
      match.content = noteToUpdate.content
      match.title = noteToUpdate.title
      
      completionHandler(.success(match))
      return
    }
    
    completionHandler(.failure(.updatingFailure(noteToUpdate.id ?? "")))
  }
  
  func deleteNote(id: String, completionHandler: @escaping (Result<Note?, QNotesError>) -> Void)
  {
    guard let match = type(of: self).dummyData[.RecycleBin]?.firstIndex(where: { $0.id == id}) else
    {
      completionHandler(.failure(.deletionFailure(id)))
      return
    }
    
    let deletedNote = type(of: self).dummyData[.RecycleBin]?.remove(at: match)
    
    completionHandler(.success(deletedNote))
  }
  
  func recycleNote(noteToRecycle: Note, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  {
    // TODO: Find note in other sections; multi-folder support
    if let match = type(of: self).dummyData[.Inbox]?.firstIndex(where: { $0 == noteToRecycle })
    {
      type(of: self).dummyData[.Inbox]?.remove(at: match)
    }
    else
    {
      completionHandler(.failure(.recyclingFailure(noteToRecycle.id ?? "")))
      return
    }
    
    type(of: self).dummyData[.RecycleBin]?.append(noteToRecycle)
    
    completionHandler(.success(noteToRecycle))
  }
  
  func restoreNote(noteToRestore: Note, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  {
    if let match = (type(of: self)).dummyData[.RecycleBin]?.firstIndex(where: { $0 == noteToRestore })
    {
      type(of: self).dummyData[.RecycleBin]?.remove(at: match)
    }
    else
    {
      // TODO: Error if not found in recycle bin?
      completionHandler(.failure(.restoringFailure(noteToRestore.id ?? "")))
      return
    }
    
    // FIXME: Multi-folder support
    type(of: self).dummyData[.Inbox]?.append(noteToRestore)
    
    completionHandler(.success(noteToRestore))
  }
  
  func fetchNotes(in folder: Folder, completionHandler: @escaping (Result<[Note], QNotesError>) -> Void)
  {
    if let notes = type(of: self).dummyData[folder]
    {
      completionHandler(.success(notes))
      return
    }
    
    type(of: self).dummyData[folder] = []
    
    return completionHandler(.success([]))
  }
  
  
}
