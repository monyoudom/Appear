//
//  DoyouknowController.swift
//  Appear
//
//  Created by Machintos-HD on 5/7/18.
//  Copyright © 2018 Chain. All rights reserved.
//

import UIKit

class DoyouknowController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Do you know?"
        let backButton = UIBarButtonItem()
        backButton.title = nil
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

   

}
