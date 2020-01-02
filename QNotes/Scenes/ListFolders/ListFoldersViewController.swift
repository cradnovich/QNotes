//
//  ListFoldersViewController.swift
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

// NOTE: The folders are hard-coded in the storyboard, so this isn't currently used
protocol ListFoldersDisplayLogic: class
{
//  func displaySomething(viewModel: ListFolders.Something.ViewModel)
}

class ListFoldersViewController: UITableViewController, ListFoldersDisplayLogic
{
  var interactor: ListFoldersBusinessLogic?
  var router: (NSObjectProtocol & ListFoldersRoutingLogic & ListFoldersDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = ListFoldersInteractor()
    let presenter = ListFoldersPresenter()
    let router = ListFoldersRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    //presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
//    let request = ListFolders.Something.Request()
//    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: ListFolders.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
