//
//  BuyCoordinator.swift
//  Cordinators
//
//  Created by Ramesh kumar penta on 08/08/21.
//

import Foundation
import UIKit

class BuyCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var nav: UINavigationController
    init(nav : UINavigationController) {
        self.nav = nav
    }
    func start() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        nav.pushViewController(vc, animated: true)
    }
    
    
}
