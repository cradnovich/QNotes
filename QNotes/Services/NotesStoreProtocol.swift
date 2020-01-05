//
//  NotesStoreProtocol.swift
//  QNotes
//
//  Created by Meir Radnovich on 02/01/2020.
//  Copyright © 2020 Meir Radnovich. All rights reserved.
//

import Foundation

enum QNotesError : Error
{
  case fileNotFound(URL)
  case untitledNote
  case systemError(Error)
  case fileUnreadable(URL)
}

protocol NotesStoreProtocol
{
  func createNote(noteToCreate: Note, in folder: Folder, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  func updateNote(noteToUpdate: Note, in folder: Folder, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  func deleteNote(id: String, from folder: Folder, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  func recycleNote(noteToRecycle: Note, /*in folder: Folder ,*/ completionHandler: @escaping (Result<Note, QNotesError>) -> Void )
  func restoreNote(noteToRestore: Note, /*to folder: Folder,*/ completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  func fetchNotes(in folder: Folder, completionHandler: @escaping (Result<[Note], QNotesError>)  -> Void)
}

protocol NotesStoreUtilityProtocol {}

let isoFormatter = ISO8601DateFormatter()

extension NotesStoreUtilityProtocol
{
  func generateId() -> String
  {
    return UUID().uuidString
  }
  
  func generateTitle(for note: Note) -> String
  {
    if note.content.isEmpty
    {
      return isoFormatter.string(from: note.date)
    }
    else
    {
      return note.content.split(separator: "\n").first?.split(separator: " ").prefix(upTo: 5).joined(separator: " ") ?? "New Note"
    }
  }
}
