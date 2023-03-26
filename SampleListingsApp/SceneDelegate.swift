//
//  SceneDelegate.swift
//  SampleListingsApp
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
          
          guard let windowScene = (scene as? UIWindowScene) else { return }

          // Create a window with the size of the windowScene
          let window = UIWindow(windowScene: windowScene)
          
          // Create a root view controller
          let listViewController = ListViewController(viewModel: ListingViewModel())
    
          // Create a root navigationController
          let navigationController = UINavigationController(rootViewController: listViewController)
    
          // Set the root view controller of the window
          window.rootViewController = navigationController
          
          // Set the window as the main window and make it visible
          self.window = window
          window.makeKeyAndVisible()
      }
}

