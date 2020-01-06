//
//  EditNoteRouter.swift
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

@objc protocol EditNoteRoutingLogic
{
  func routeToListNotes(segue: UIStoryboardSegue?)
}

protocol EditNoteDataPassing
{
  var dataStore: EditNoteDataStore? { get }
}

class EditNoteRouter: NSObject, EditNoteRoutingLogic, EditNoteDataPassing
{
  weak var viewController: EditNoteViewController?
  var dataStore: EditNoteDataStore?
  
  // MARK: Routing
  
  func routeToListNotes(segue: UIStoryboardSegue?)
  {
    if let segue = segue
    {
        // TODO?
      
    }
    else
    {
      
      guard let ds = dataStore, let vc = viewController, let splitRoot = vc.splitViewController, let masterNav = splitRoot.viewControllers.first as? UINavigationController, let destinationVC = masterNav.viewControllers.first(where: {$0 is ListNotesViewController}) as? ListNotesViewController, var destinationDS = destinationVC.router?.dataStore else
      {
        // TODO
        return
      }
      
      passDataToListNotes(source: ds, destination: &destinationDS)
      navigateToListNotes(source: vc, destination: destinationVC)
    }
  }

  // MARK: Navigation
  
  func navigateToListNotes(source: EditNoteViewController, destination: ListNotesViewController)
  {
    source.navigationController?.navigationController?.popViewController(animated: true)
  }
  
  // MARK: Passing data
  
  func passDataToListNotes(source: EditNoteDataStore, destination: inout ListNotesDataStore)
  {
  }
}
