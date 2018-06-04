//
//  ExploreController.swift
//  Appear
//
//  Created by Machintos-HD on 5/7/18.
//  Copyright © 2018 Chain. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Explore"
        let backButton = UIBarButtonItem()
        backButton.title = nil
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
