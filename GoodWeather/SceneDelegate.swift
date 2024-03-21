//
//  SceneDelegate.swift
//  GoodWeather
//
//  Created by joe on 3/21/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        setupNewNavBarAppearance()
    }

    @available(iOS 13.0, *)
    func setupNewNavBarAppearance() {
        let newNavBarAppearance = UINavigationBarAppearance()
        newNavBarAppearance.configureWithDefaultBackground()
        newNavBarAppearance.backgroundColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        newNavBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        newNavBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().scrollEdgeAppearance = newNavBarAppearance
        UINavigationBar.appearance().compactAppearance = newNavBarAppearance
        UINavigationBar.appearance().standardAppearance = newNavBarAppearance
        
        UIBarButtonItem.appearance().tintColor = UIColor.white
    }
}

