//
//  AppDelegate.swift
//  Test0107
//
//  Created by beck tian on 2020/1/7.
//  Copyright © 2020 beck tian. All rights reserved.
//

import UIKit
import Flutter

let APP =  UIApplication.shared.delegate as! AppDelegate

@UIApplicationMain
class AppDelegate: FlutterAppDelegate  {
    
    var blockRotation: UIInterfaceOrientationMask = .portrait{
        didSet{
            
            if blockRotation.contains(.portrait){
                //强制设置成 竖屏
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            }
            else if blockRotation.contains(.allButUpsideDown){
                //强制设置成all
                UIDevice.current.setValue(UIInterfaceOrientation.unknown.rawValue, forKey: "orientation")
            }
            else{
                //强制设置成横屏
                UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
                
            }
        }
        
    }
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        initFlutterEngine(with: kLaunchAnEngineEntryPoint)
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = ViewController()
        rootVC.modalPresentationStyle = .fullScreen
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    // 切换横竖屏
    override func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        
        return .all
    }

    
}

