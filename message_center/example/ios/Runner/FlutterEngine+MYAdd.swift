//
//  FlutterEngine+MYAdd.swift
//  UpClassiPhone
//
//  Created by diff on 2020/5/14.
//  Copyright © 2020 beck tian. All rights reserved.
//
import Flutter

extension NSNotification.Name {
    static let kFlutterEngineCallBack = NSNotification.Name(rawValue: "kFlutterEngineCallBack")
}

private let kDYFlutterEngineInitialized: UnsafeRawPointer! = UnsafeRawPointer(bitPattern: "kDYFlutterEngineInitialized".hashValue)
