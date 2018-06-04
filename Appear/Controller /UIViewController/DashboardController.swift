    //
//  ViewController.swift
//  Appear
//
//  Created by Machintos-HD on 4/19/18.
//  Copyright © 2018 Chain. All rights reserved.
//

import UIKit



class DashboardController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    let imageArrayP = ["Angkor Wat temple","Beng Mealea temple","Koh Keh temple"]
    let imageArrayR = ["Neak Pon temple","Sras srong","Ta Keo temple","Ta Promh temple","Tarrace of Elephant temple"]
    let decriP = ["Angkor Wat temple","Beng Mealea temple","Angkorwat is the temple"]
    let titleP = ["Angkor Wat temple","Beng Mealea temple","Koh Keh temple"]
    let titleR = ["Neak Pon temple","Sras srong","Ta Keo temple","Ta Promh temple","Tarrace of Elephant"]
    let decriR = ["50K views","2K views","100K views","1M views","10K views"]
    @IBOutlet weak var carousel: ZKCarousel! = ZKCarousel()
    @IBOutlet weak var popularCells: UICollectionView!
        
    @IBOutlet weak var recenCell: UICollectionView!
    let sizeB : CGSize = CGSize(width: 200, height: 150)
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    
    var sizeA = CGSize(width: 150, height: 100)
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCells.dataSource = self
        popularCells.delegate = self
        recenCell.dataSource = self
        recenCell.delegate = self
        self.navigationItem.title = "Appear"
        let backButton = UIBarButtonItem()
        backButton.title = nil
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        setupCarousel()
        
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    override var prefersStatusBarHidden: Bool {
        return false
    }
        
    func collectionView(_ collectionView: UICollectionView,
                                     numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.recenCell {
             return 5
        } else {
             return 3
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == self.recenCell {
            return sizeA
        } else {
             return sizeB
        }
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
    }
   
   
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.popularCells {
            let cell = popularCells.dequeueReusableCell(withReuseIdentifier: "popluarplace", for: indexPath) as! PopularCell
            cell.layer.cornerRadius = 2
            cell.layer.shadowOffset.height = 3
            cell.layer.shadowOffset.width = 0
            cell.layer.shadowOpacity = 0.5
            cell.layer.shadowColor = shadowColor?.cgColor
            cell.layer.borderWidth = 0.1
            cell.imageBackground.image = UIImage(named: imageArrayP[indexPath.row])
            cell.title.text = titleP[indexPath.row]
            cell.decri.text = decriP[indexPath.row]
            
            return cell
            
        } else {
             let cell = recenCell.dequeueReusableCell(withReuseIdentifier: "recencell", for: indexPath) as! RecenCell
             cell.layer.cornerRadius = 2
             cell.layer.shadowOffset.height = 3
             cell.layer.shadowOffset.width = 0
             cell.layer.shadowOpacity = 0.5
             cell.layer.shadowColor = shadowColor?.cgColor
             cell.layer.borderWidth = 0.1
             cell.imageBackgroundR.image = UIImage(named: imageArrayR[indexPath.row])
             cell.titleR.text = titleR[indexPath.row]
             cell.decriR.text = decriR[indexPath.row]
            
            return cell
            
        }
        
     
    }
    private func setupCarousel() {
        
        // Create as many slides as you'd like to show in the carousel
        let slide = ZKCarouselSlide(image: UIImage(named: "1")!, title: "", description: "Welcome to Cambodia")
        let slide1 = ZKCarouselSlide(image: UIImage(named: "2")!, title: "", description: "Appear for you")
        let slide2 = ZKCarouselSlide(image: UIImage(named: "3")!, title: "", description: "King dom of wonder")
        
        // Add the slides to the carousel
        self.carousel.slides = [slide, slide1, slide2]
        
        
        // You can optionally use the 'interval' property to set the timing for automatic slide changes. The default is 1 second.
        self.carousel.interval = 10
        
        // Optional - automatic switching between slides.
        self.carousel.start()
    }
   
    
}
    

    

    
    




