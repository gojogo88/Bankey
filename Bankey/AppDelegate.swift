//
//  AppDelegate.swift
//  Bankey
//
//  Created by Jonathan Go on 12.03.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let loginVC = LoginVC()
    let onboardingContainerVC = OnboardingContainerVC()
    let dummyVC = DummyVC()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginVC.delegate = self
        onboardingContainerVC.delgate = self
        dummyVC.delegate = self
        
        window?.rootViewController = loginVC
        
        return true
    }

}

extension AppDelegate: LoginVCDelegate {
    func didLogin() {
        setRootVC(onboardingContainerVC)
    }
}

extension AppDelegate: OnboardingContainerVCDelegate {
    func didFinishOnboarding() {
        setRootVC(dummyVC)
    }
}

extension AppDelegate: LogouDelegate {
    func didLogout() {
        setRootVC(loginVC)
    }
}

extension AppDelegate {
    func setRootVC(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}
