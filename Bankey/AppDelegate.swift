//
//  AppDelegate.swift
//  Bankey
//
//  Created by Jonathan Go on 12.03.22.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let loginVC = LoginVC()
    let onboardingContainerVC = OnboardingContainerVC()
    let dummyVC = DummyVC()
    let mainVC = MainVC()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginVC.delegate = self
        onboardingContainerVC.delgate = self
        dummyVC.delegate = self
        
        window?.rootViewController = AccountSummaryVC()
        mainVC.selectedIndex = 0
        
        return true
    }

}

extension AppDelegate: LoginVCDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootVC(dummyVC)
        } else {
            setRootVC(onboardingContainerVC)
        }
    }
}

extension AppDelegate: OnboardingContainerVCDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
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
