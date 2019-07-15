//
//  UIApplication+Extension.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2019 Stanwood GmbH (www.stanwood.io)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

extension UIApplication {
    
    /// Applictaion short veriosn i'e. 2.3.2
    public static var shortVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    /// Applictaion build number i'e. 173
    public static var buildVersion: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
    
    /// Applictaion app name
    public static var appName: String {
        return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? ""
    }
    
    /// Stanwood environments
    public enum Env: String {
        case debug, stage, release
    }
    
    /**
     Set the user agent, i'e ios-your_app_name-1.1:345-release
     
     - Parameters:
        - env: workspace environment
     */
    public func setUserAgent(env: Env) {
        let userAgent = "ios-\(UIApplication.appName.snakeCased() ?? UIApplication.appName)-\(UIApplication.shortVersion):\(UIApplication.buildVersion)-\(env.rawValue)"
        UserDefaults.standard.register(defaults: ["UserAgent": userAgent])
    }
    
    /// Current presented viewController
    public static var presentedViewController: UIViewController? {
        return topViewController()
    }
    
    private static func topViewController(_ base: UIViewController? = shared.delegate?.window??.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        } else if let tab = base as? UITabBarController,
            let selected = tab.selectedViewController {
            return topViewController(selected)
        } else if let presented = base?.presentedViewController {
            return topViewController(presented)
        } else {
            return base
        }
    }
}
