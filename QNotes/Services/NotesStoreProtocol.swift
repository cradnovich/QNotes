//
//  NotesStoreProtocol.swift
//  QNotes
//
//  Created by Meir Radnovich on 02/01/2020.
//  Copyright © 2020 Meir Radnovich. All rights reserved.
//

import Foundation


protocol NotesStoreProtocol
{
  func createNote(noteToCreate: Note, in folder: Folder, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  func updateNote(noteToUpdate: Note, in folder: Folder, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  func deleteNote(id: String, completionHandler: @escaping (Result<Note?, QNotesError>) -> Void)
  func recycleNote(noteToRecycle: Note, /*in folder: Folder ,*/ completionHandler: @escaping (Result<Note, QNotesError>) -> Void )
  func restoreNote(noteToRestore: Note, /*to folder: Folder,*/ completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  func fetchNotes(in folder: Folder, completionHandler: @escaping (Result<[Note], QNotesError>)  -> Void)
  func fetchNote(id: String, in folder: Folder, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  func emptyRecycleBin(completionHandler: @escaping (Result<Void, QNotesError>) -> Void)
}

protocol NotesStoreUtilityProtocol {}

let isoFormatter = ISO8601DateFormatter()

extension NotesStoreUtilityProtocol
{
  func generateId() -> String
  {
    return UUID().uuidString
  }
  
  func generateTitle(from content: String) -> String
  {
    return content.split(separator: "\n").first?.split(separator: " ").prefix(5).joined(separator: " ") ?? "New Note"
  }
  
  func generateTitle(for note: Note) -> String
  {
    if note.content.isEmpty
    {
      return isoFormatter.string(from: note.date)
    }
    else
    {
      return generateTitle(from: note.content)
    }
  }
}
