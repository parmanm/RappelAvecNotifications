//
//  AppDelegate.swift
//  RappelAvecNotifications
//
//  Created by Maxime Parmantier Cloiseau on 15/01/2020.
//  Copyright © 2020 RUN4U Studio. All rights reserved.
//

import UIKit
//Notification locale
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    //création d'une constante permettant l'utilisation du notification center
    let notificationCenter = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Les options voulu pour la notification locale
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]

        //demande d'authorisation pour recevoir des notifications à l'utilisateur
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            //Si l'utilisateur n'as pas accepté de recevoir des notifications
            if !didAllow {
                print("L'utilisateur a désactivé les notifications")
            }
        }
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let hexString = deviceToken.map { String(format: "%02hhx", $0) }.joined()
        print(hexString)
    }

    //Suppression de la notification lorsqu'elle a été lu
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        //vérifier que l'id existe bien
        guard let idToDelete = userInfo["del-id"] as? String else {
            completionHandler(.noData)
            return
        }

        //supprimer la notification avec l'id
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [idToDelete])
        completionHandler(.noData)
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

