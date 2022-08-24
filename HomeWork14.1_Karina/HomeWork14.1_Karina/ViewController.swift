//
//  ViewController.swift
//  HomeWork14.1_Karina
//
//  Created by Karina Kovaleva on 23.08.22.
//

import UIKit

protocol SettingsForButtonDelegate: AnyObject {
    var myBackgroundColor: UIColor { get set }
    var titleColor: UIColor { get set }
    func writeAboutButton(_ button: UIButton)
}

class MyView: UIView {
    
    weak var delegate: SettingsForButtonDelegate?
    
    @IBAction func settingsButton(_ sender: UIButton) {
        let view = sender.superview
        view?.subviews.forEach { $0.backgroundColor = delegate?.myBackgroundColor }
        view?.subviews.forEach { $0.tintColor = delegate?.titleColor }
        view?.subviews.forEach { $0.layer.cornerRadius = $0.frame.height / 2 }
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        delegate?.writeAboutButton(sender)
    }
}

class ViewController: UIViewController, SettingsForButtonDelegate {

    

    var titleColor: UIColor = .black
    var myBackgroundColor: UIColor = .yellow

    @IBOutlet weak var viewForButton: MyView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewForButton?.delegate = self
    }
    
    func writeAboutButton(_ button: UIButton) {
        print("\(String(describing: button.currentTitle))")
    }
    
    
}

