//
//  ViewController.swift
//  Test0107
//
//  Created by beck tian on 2020/1/7.
//  Copyright © 2020 beck tian. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    
}

extension ViewController: FlutterStreamHandler {
    
    //Flutter -> iOS
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        events("")//iOS -> Flutter
        return nil
    }
    
    //Flutter -> iOS
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        print(arguments as Any)
        return nil
    }
    
}

