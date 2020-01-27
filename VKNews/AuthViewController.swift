//
//  AuthViewController.swift
//  VKNews
//
//  Created by it10 on 27/01/2020.
//  Copyright © 2020 Viachaslau Tsitou. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        authService = AppDelegate.shared().authSevice
    }
    

    @IBAction func signInTouch() {
        authService.wakeUpSession()
    }
    

}
