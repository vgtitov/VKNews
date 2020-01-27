//
//  UIViewController + Storyboard.swift
//  VKNews
//
//  Created by it10 on 27/01/2020.
//  Copyright © 2020 Viachaslau Tsitou. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    class func loadFromStoryboard<T: UIViewController>()->T{
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: No initial view controller in \(name) storyboard!")
        }
    }
}
