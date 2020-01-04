//
//  ErrorDisplayer.swift
//  QNotes
//
//  Created by Meir Radnovich on 04/01/2020.
//  Copyright © 2020 Meir Radnovich. All rights reserved.
//

import UIKit

protocol ErrorDisplayer
{
  func showError(error: Error)
  func showErrorMessage(title: String, message: String)
}

extension ErrorDisplayer
{
  func showError(error: Error)
  {
    showErrorMessage(title: "Error", message: error.localizedDescription)
  }
}

extension UIViewController : ErrorDisplayer
{
  
  
  func showErrorMessage(title: String, message: String)
  {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(alertAction)
    showDetailViewController(alertController, sender: nil)
  }
}
