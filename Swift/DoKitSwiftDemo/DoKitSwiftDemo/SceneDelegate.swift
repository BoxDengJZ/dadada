//
//  SceneDelegate.swift
//  DoKitSwiftDemo
//
//  Created by didi on 2020/5/11.
//  Copyright © 2020 didi. All rights reserved.
//

import UIKit
import DoraemonKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        DoraemonManager.shareInstance().addPlugin(withTitle: DoraemonDemoLocalizedString("测试插件"), icon: "doraemon_default", desc: DoraemonDemoLocalizedString("测试插件"), pluginName: "TestPlugin", atModule: DoraemonDemoLocalizedString("业务工具"))
        
        DoraemonManager.shareInstance().addPlugin(withTitle: DoraemonDemoLocalizedString("block方式加入插件"), icon: "doraemon_default", desc: DoraemonDemoLocalizedString("测试插件"), pluginName: "", atModule: DoraemonDemoLocalizedString("业务工具")) { (itemData: [AnyHashable : Any]) in
            print(itemData)
        }
        DoraemonManager.shareInstance().install()

        self.window = UIWindow(windowScene: scene as! UIWindowScene)
        self.window?.frame = UIScreen.main.bounds;
        let homeVc = DoraemonDemoHomeViewController()
        let nav = UINavigationController(rootViewController: homeVc)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
    }

}

