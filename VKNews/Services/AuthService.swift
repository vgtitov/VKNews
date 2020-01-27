//
//  AuthService.swift
//  VKNews
//
//  Created by it10 on 27/01/2020.
//  Copyright © 2020 Viachaslau Tsitou. All rights reserved.
//

import Foundation
import VKSdkFramework

protocol AuthServiceDelegate: class {
    func authServiceShuldShow(_ viewController: UIViewController)
    func authServiceSingIn()
    func authServiceDidSingInFail()
}

final class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate{

    private let appId = "7292463"
    private let vkSdk: VKSdk
    
    weak var delegate: AuthServiceDelegate?
    
    override init(){
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        print("VKSdk.initialize")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
        
    }
    
    func wakeUpSession()
    {
        let scope = ["offline"]
        
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            if state == VKAuthorizationState.authorized {
                print("VKAuthorizationState.authorized")
                delegate?.authServiceSingIn()
            } else if state == VKAuthorizationState.initialized{
                print("VKAuthorizationState.initialized")
                VKSdk.authorize(scope)
            } else {
                print("auth problems, state \(state) error \(String(describing: error))")
                delegate?.authServiceDidSingInFail()
            }
        }
    }
    
    // MARK: VKSdkDelegate
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil{
            delegate?.authServiceSingIn()
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    
    // MARK: VKSdkUIDelegate
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShuldShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
    
}
