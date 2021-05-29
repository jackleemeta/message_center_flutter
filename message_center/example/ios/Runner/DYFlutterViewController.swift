//
//  DYFlutterViewController.swift
//  UpClassiPhone
//
//  Created by diff on 2020/3/30.
//  Copyright © 2020 beck tian. All rights reserved.
//

import Flutter

var vcMethodChannel: FlutterMethodChannel?

class DYFlutterViewController: FlutterViewController {
    
    var callBack: ((_ method: String?, _ arguments: Any?) -> Any?)?
    
    var rootRoute: String?
    
    var jitRoute: String? //just in time route
    
    /// 通过路由初始化
    convenience init(rootRoute: String) {
        self.init()
    }
    
    /// 通过某个engine初始化
    convenience init(engine: FlutterEngine) {
        self.init(engine: engine, nibName: nil, bundle: nil)
        initEvents(with: engine)
    }
    
    /// deinit
    deinit {
        debugPrint("DYFlutterViewController Deinit")
    }
    
    /// 极光引擎
    // MARK: - Private Method
    
    /// 初始化事件
    private func initEvents(with engine: FlutterEngine) {
        view.backgroundColor = .white
        modalPresentationStyle = .fullScreen
        hidesBottomBarWhenPushed = true
        //        fd_prefersNavigationBarHidden = true
        //        MBProgressHUD.show(on: APP!.window!)
        //        setFlutterViewDidRenderCallback {
        //            MBProgressHUD.hide(on: APP!.window!)
        //        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(dealViewEvents(noti:)), name: NSNotification.Name.kFlutterEngineCallBack, object: engine)
    }
    
    /// 处理view事件
    @objc  private func dealViewEvents(noti: Notification) {}
    
    private var needHomeIndicatorHidden = false
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return needHomeIndicatorHidden
    }
    
    func customSetHomeIndicatorHidden(hidden: Bool) {
        needHomeIndicatorHidden = hidden
        if #available(iOS 11.0, *) {
            setNeedsUpdateOfHomeIndicatorAutoHidden()
        }
    }
    
}
