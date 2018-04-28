//
//  ViewController.swift
//  Appear
//
//  Created by Machintos-HD on 4/19/18.
//  Copyright © 2018 Chain. All rights reserved.
//

import UIKit

class DashboardController: UIViewController,UISearchBarDelegate {
    
    @IBOutlet weak var searchBtn: UIBarButtonItem!
    var searchBar = UISearchBar()
    var textFieldInsideSearchBar =  UITextField()
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.searchBarStyle = UISearchBarStyle.minimal
        textFieldInsideSearchBar  = (searchBar.value(forKey: "searchField") as? UITextField)!
        
    }
    
}

// UI
extension DashboardController {
    func setupNavigationBar() {
        self.searchBar.tintColor = UIColor.clear
        self.searchBar.backgroundColor = UIColor.clear
        self.searchBar.isTranslucent = true
        self.textFieldInsideSearchBar.textColor = UIColor.white
    
        let searchBarContainer = SearchBarContainerView(customSearchBar: searchBar)
        searchBarContainer.frame = CGRect(x: 0, y: 0, width: view.frame.width + 20, height: 60)
        navigationItem.titleView = searchBarContainer
    }
    func showSearchBar() {
        self.searchBtn.image =  UIImage(named: "cancel")
        self.searchBtn.tag = 1
        setupNavigationBar()
        UIView.animate(withDuration: 0.5, animations: {
            self.searchBar.alpha = 1
        }, completion: { finished in
            self.searchBar.becomeFirstResponder()
        })
    }
    
    func hideSearchBar() {
        self.searchBtn.image =  UIImage(named: "search")
        self.searchBtn.tag = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.searchBar.alpha = 0
        }, completion: nil)
    }
}

// Action Button

extension DashboardController {
    @IBAction func searchButtonPressed(sender: AnyObject) {
        
        if sender.tag == 0 {
            showSearchBar()
        } else {
            self.textFieldInsideSearchBar.text = ""
           self.textFieldInsideSearchBar.endEditing(true)
            hideSearchBar()
        }
       
        
    }
   
}

// HELP Class
extension DashboardController {
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
// set SearchBar height and width
class SearchBarContainerView: UIView {
    
    let searchBar: UISearchBar
    
    init(customSearchBar: UISearchBar) {
        searchBar = customSearchBar
        super.init(frame: CGRect.zero)
        addSubview(searchBar)
    }
    
    override convenience init(frame: CGRect) {
        self.init(customSearchBar: UISearchBar())
        self.frame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchBar.frame = bounds
    }
}

    
    

    

    
    




