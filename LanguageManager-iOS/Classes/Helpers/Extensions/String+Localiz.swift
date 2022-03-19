//
//  String+Helpers.swift
//  LanguageManager-iOS
//
//  Created by abedalkareem omreyh on 10/11/2020.
//

import Foundation

public extension String {
    ///
    /// Localize the current string to the selected language
    ///
    /// - returns: The localized string
    ///
    func localiz(comment: String = "") -> String {
        let currentLanguage = LanguageManager.shared.currentLanguage.rawValue
        // Check strings file existed
        guard let langPath = Bundle.main.path(forResource: currentLanguage, ofType: "strings"),
              FileManager.default.fileExists(atPath: langPath) else {
                  guard let langProj = Bundle.main.path(forResource: currentLanguage, ofType: "lproj"),
                        let langBundle = Bundle(path: langProj) else {
                            return NSLocalizedString(self, tableName: currentLanguage, bundle: .main, value: "", comment: comment)
                        }
                  
                  return NSLocalizedString(self, tableName: nil, bundle: langBundle, comment: comment)
              }
        
        return NSLocalizedString(self, tableName: currentLanguage, bundle: .main, value: "", comment: comment)
    }
    
}
