//
//  Storyboarded.swift
//  Cordinators
//
//  Created by Ramesh kumar penta on 08/08/21.
//

import Foundation

import UIKit
protocol Storyboarded {
    static func instantiate() ->  Self
}

extension Storyboarded where Self : UIViewController {
    static func instantiate() -> Self {
        let id  = String(describing: self)
        return UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: id)
    }
    
}

