//
//  SettingsViewController.swift
//  LanguageManager
//
//  Created by abedalkareem omreyh on 4/9/17.
//  Copyright © 2017 abedalkareem. All rights reserved.
//

import LanguageManager_iOS
import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    
    @IBAction func changeLanguage(_ sender: UIButton) {
        
        let languageList: [Languages] = [.en, .ar, .th]
        
        let selectedLanguage: Languages = languageList[sender.tag]
        
        // Change the language
        LanguageManager.shared.setLanguage(language: selectedLanguage) { title -> UIViewController in
            print("title of the scene: \(title ?? "")")
            // The view controller that you want to show after changing the language
            //return self.viewControllerToShow()
            return self.getMainView()
        } animation: { view in
            // Do custom animation
            view.transform = CGAffineTransform(scaleX: 2, y: 2)
            view.alpha = 0
        }
    }
    
    private func getMainView() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "MainNav")
    }
    
    private func viewControllerToShow() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }
}
