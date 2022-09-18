//
//  AppDelegate.swift
//  Traxer_HackZurich
//
//  Created by siboraPune on 18.09.22.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI
import FirebaseCore
//MARK : Push Notification
// add this code in AppDelegate.swift outside of classs

import UserNotifications


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
  }
    func application(_ application: UIApplication,
               didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       // Override point for customization after application launch.you’re
       UIApplication.shared.registerForRemoteNotifications()
       return true
    }

    func application(_ application: UIApplication,
                didRegisterForRemoteNotificationsWithDeviceToken
                    deviceToken: Data) {
      
    }

    func application(_ application: UIApplication,
                didFailToRegisterForRemoteNotificationsWithError
                    error: Error) {
       // Try again later.
    }

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {


        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
            // Enable or disable features based on authorization.
        }
        application.registerForRemoteNotifications()
        return true
}

extension AppDelegate:UNUserNotificationCenterDelegate {
    func registerForRemoteNotification(application: UIApplication) {
        if #available(iOS 10.0, *) {
            let center  = UNUserNotificationCenter.current()
            center.delegate = self
            center.requestAuthorization(options: [.alert,.sound,.badge], completionHandler: { (complete, error) in
                if let err = error {
                    print(err.localizedDescription)
                } else {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            })
        }
        else {
            let types:UIUserNotificationType = ([.alert, .sound, .badge])
            let settings:UIUserNotificationSettings = UIUserNotificationSettings(types:types, categories:nil)
            application.registerUserNotificationSettings(settings)
            application.registerForRemoteNotifications()
        }
    }
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("User Info = ",response.notification.request.content.userInfo)
        completionHandler()

    }
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("User Info = ",notification.request.content.userInfo)
        completionHandler([.alert,.sound,.badge])
    }

    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        print(deviceToken)
    }

    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("Fail to register for notification : \(error.localizedDescription)")
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

        if UIApplication.shared.applicationState == .active {
            if let dictAps = userInfo["aps"] as? NSDictionary {
                if let message = dictAps["alert"] as? String {
                    print(message) // show

                }
            }
        }

    }
}
