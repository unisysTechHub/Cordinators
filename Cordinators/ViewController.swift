//
//  ViewController.swift
//  Cordinators
//
//  Created by Ramesh kumar penta on 08/08/21.
//

import UIKit
protocol ViewControllerDelegate {
    func buy()
    func createAccount()
}
class ViewController: UIViewController, Storyboarded {
    var coordinator : MainCoordinator?
    

    @IBAction func createAccountTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buy()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

