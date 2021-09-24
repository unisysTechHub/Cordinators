//
//  CreateAccountCoordinator.swift
//  Cordinators
//
//  Created by Ramesh kumar penta on 08/08/21.
//

import Foundation
import UIKit
class CreateAccountCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var nav: UINavigationController
    
    func start() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        nav.pushViewController(vc, animated: true)
    }
    
    
    init(nav : UINavigationController) {
        self.nav = nav
    }
}
