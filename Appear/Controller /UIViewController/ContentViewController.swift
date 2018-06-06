//
//  ContentControllerViewController.swift
//  Appear
//
//  Created by Machintos-HD on 6/3/18.
//  Copyright © 2018 Chain. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var content: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if !contantCheck {
            image.image = UIImage(named: "c")
            content.text = "[ភាសាខ្មែរ]\nប្រាសាទអង្គរវត្តស្ថិតនៅខេត្តសៀមរាបនៃខេត្តសៀមរាបគឺជាផ្នែកមួយនៃតំបន់បុរាណវិទ្យាសំខាន់បំផុតនៅអាស៊ីអាគ្នេយ៍។ វាលាតសន្ធឹងប្រហែលជា 400 គីឡូម៉ែត្រការ៉េនិងមានប្រាសាទចំនួនពីរសំណង់ធារាសាស្ត្រ(អាងស្តុកទឹកអាងទឹកអាងស្តុកទឹកប្រឡាយទឹក)និងផ្លូវទំនាក់ទំនង។\n\n[English]\nA bas-relief (above) at the temple of Angkor Wat in Cambodia, includes a depiction of devas and asuras working together to stir up the Ocean of Milk in an attempt to free the precious objects lost within, including the elixir of immortality called Amrita.\n\n[தமிழ்] \nகம்போடியாவில் உள்ள அங்கோர் வாட் கோவிலில் ஒரு அடிப்படை நிவாரணம் (மேலே), அமிர்தா என்ற அழியாவின் அமுதம் உட்பட, தொலைவில் உள்ள விலையுயர்ந்த பொருட்களை விடுவிப்பதற்கான முயற்சியில் பால் மற்றும் பெருங்கடலை தூண்டுவதற்காக ஒன்றாக பணியாற்றும் பக்தர்களும் அசுரர்களும்.\n\n[中文]\n柬埔寨吴哥窟寺庙内的浅浮雕（上图）包括描绘天神和阿苏拉斯共同煽动牛奶的海洋，试图释放失去的珍贵物品，包括被称为不朽丹药甘露"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true) {}
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
