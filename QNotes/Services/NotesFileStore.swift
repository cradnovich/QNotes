//
//  NotesFileStore.swift
//  QNotes
//
//  Created by Meir Radnovich on 02/01/2020.
//  Copyright © 2020 Meir Radnovich. All rights reserved.
//

import Foundation

class NotesFileStore : NotesStoreProtocol, NotesStoreUtilityProtocol
{
  private let fileManager = FileManager()
  
  private lazy var documentsFolder: URL = {
    return fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
  }()
  
  func createNote(noteToCreate: Note, in folder: Folder, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  {
    var note = noteToCreate
    note.id = generateId()
    
  }
  
  func updateNote(noteToUpdate: Note, in folder: Folder, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  {
     
  }
  
  func fetchNotes(in folder: Folder, completionHandler: @escaping (Result<[Note], QNotesError>)  -> Void)
  {
    let folderUrl = url(for: folder)
    
    do
    {
      let contents = try fileManager.contentsOfDirectory(at: folderUrl, includingPropertiesForKeys: [.creationDateKey, .typeIdentifierKey], options: [.skipsHiddenFiles, .skipsSubdirectoryDescendants])
      
      var n: [Note] = []
      
      for u in contents
      {
        n.append(try note(at: u))
      }
      
      completionHandler(.success(n))
    }
    catch let error as QNotesError
    {
      completionHandler(.failure(error))
    }
    catch
    {
      completionHandler(.failure(.systemError(error)))
    }
  }
  
  func deleteNote(id: String, from folder: Folder, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  {
    
  }
  
  func restoreNote(noteToRestore: Note, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  {
    do
    {
      let recycledLocation = try file(for: noteToRestore, in: Folder.RecycleBin)
      
      guard fileManager.fileExists(atPath: recycledLocation.absoluteString) else
      {
        completionHandler(.failure(.fileNotFound(recycledLocation)))
        return
      }
      
      // FIXME: Hard-coded "active" folder
      let noteLocation = try file(for: noteToRestore, in: Folder.Inbox)

      try fileManager.moveItem(at: recycledLocation, to: noteLocation)
    }
    catch let error as QNotesError
    {
      completionHandler(.failure(error))
      return
    }
    catch
    {
      completionHandler(.failure(.systemError(error)))
      return
    }
    
    completionHandler(.success(noteToRestore))
  }
  
  
  func recycleNote(noteToRecycle: Note, completionHandler: @escaping (Result<Note, QNotesError>) -> Void)
  {
    do
    {
      // FIXME: Hard-coded "active" folder
      let noteLocation = try file(for: noteToRecycle, in: Folder.Inbox)
      
      guard fileManager.fileExists(atPath: noteLocation.absoluteString) else
      {
        completionHandler(.failure(.fileNotFound(noteLocation)))
        return
      }

      let recycledLocation = try file(for: noteToRecycle, in: Folder.RecycleBin)
      
      try fileManager.moveItem(at: noteLocation, to: recycledLocation)
    }
    catch let error as QNotesError
    {
      completionHandler(.failure(error))
      return
    }
    catch
    {
      completionHandler(.failure(.systemError(error)))
      return
    }
    
    completionHandler(.success(noteToRecycle))
  }
  
  private func note(at url: URL) throws -> Note
  {
    let creationTime = try url.resourceValues(forKeys: [.creationDateKey]).creationDate ?? Date()
    
    guard let contentData = fileManager.contents(atPath: url.absoluteString), let contentString = String(data: contentData, encoding: .utf8) else
    {
      throw QNotesError.fileUnreadable(url)
    }
    
    return Note(id: url.deletingPathExtension().lastPathComponent, date: creationTime, title: "", content: contentString)
  }
  
  private func url(for folder: Folder) -> URL
  {
    return documentsFolder.appendingPathComponent(folder.name, isDirectory: true)
  }
  
  private func file(for note: Note, in folder: Folder) throws -> URL
  {
    guard let id = note.id else
    {
      throw QNotesError.untitledNote
    }
    
    return url(for: folder).appendingPathComponent(id).appendingPathExtension("txt")
  }
}