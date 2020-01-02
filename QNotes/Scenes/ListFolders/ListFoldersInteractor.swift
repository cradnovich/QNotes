//
//  ListFoldersInteractor.swift
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

protocol ListFoldersBusinessLogic
{
//  func doSomething(request: ListFolders.Something.Request)
}

protocol ListFoldersDataStore
{
//  var name: String { get set }
}

class ListFoldersInteractor: ListFoldersBusinessLogic, ListFoldersDataStore
{
  var presenter: ListFoldersPresentationLogic?
  var worker: ListFoldersWorker?
  
  // MARK: Do something
  
  // TODO: Retrieve a list on folder names, for example
  func doSomething(request: ListFolders.Something.Request)
  {
//    worker = ListFoldersWorker()
//    worker?.doSomeWork()
//
//    let response = ListFolders.Something.Response()
//    presenter?.presentSomething(response: response)
  }
}
