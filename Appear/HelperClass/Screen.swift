//
//  Screen.swift
//  Natra
//
//  Created by Choeng Eanghort on 12/28/16.
//  Copyright © 2016 Magical Technology. All rights reserved.
//

import UIKit

struct Screen {
    
    static func goToContant(fromController viewController: UIViewController, controollerName :String){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainController = storyboard.instantiateViewController(withIdentifier: controollerName)
        UIApplication.shared.keyWindow?.rootViewController = mainController
    }
  
    
    
}



