//
//  Coordinator.swift
//  Cordinators
//
//  Created by Ramesh kumar penta on 08/08/21.
//

import Foundation
import UIKit
protocol Coordinator : AnyObject {
    var childCoordinators : [Coordinator] {get set}
    var nav : UINavigationController { get set }
    func start()
}

class MainCoordinator : NSObject, Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var nav: UINavigationController
    
    init(nav : UINavigationController) {
        self.nav = nav
    }
    func start()  {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        nav.pushViewController(vc, animated: true)
    }
    
    
}

extension MainCoordinator : ViewControllerDelegate {
    func buy() {
        let buyCoordinator = BuyCoordinator(nav: self.nav)
        childCoordinators.append(buyCoordinator)
        buyCoordinator.start()
    }
    
    func createAccount() {
        let createAccountOrdinator = CreateAccountCoordinator(nav: self.nav)
        childCoordinators.append(createAccountOrdinator)
        createAccountOrdinator.start()
        // present create account view controller
    }
}
extension MainCoordinator {
   func chidDidFinish(_ childCoordinator : Coordinator) {
    for (index, child) in childCoordinators.enumerated() {
        if child === childCoordinator {
            childCoordinators.remove(at: index)
        }
    }
    }
}
extension MainCoordinator : UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let buyViewController =  fromViewController as? BuyViewController {
            chidDidFinish(buyViewController.coordinator!)
        }
        if let createAccountViewController =  fromViewController as? CreateAccountViewController {
            chidDidFinish(createAccountViewController.coordinator!)
        }
    }
    
}
