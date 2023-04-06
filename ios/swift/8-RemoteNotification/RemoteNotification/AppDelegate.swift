//
//  AppDelegate.swift
//  LoginTutorial
//
//  Created by QuentinArguillere on 31/07/2020.
//  Copyright © 2020 BelledonneCommunications. All rights reserved.
//

import UIKit
import SwiftUI
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
	
	@ObservedObject var tutorialContext = RemoteNotificationTutorialContext()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		registerForPushNotifications()
		return true
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
	
	func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
		var stringifiedToken = deviceToken.map{String(format: "%02X", $0)}.joined()
		stringifiedToken.append(String(":remote"))
		tutorialContext.mCore.didRegisterForRemotePushWithStringifiedToken(deviceTokenStr: stringifiedToken)
	}
	
	func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]
					 , fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
			
	}
	func registerForPushNotifications() {
	  //1
	  UNUserNotificationCenter.current()
		//2
		.requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
		  //3
		  print("Permission granted: \(granted)")
		}
	}
	
	
}

