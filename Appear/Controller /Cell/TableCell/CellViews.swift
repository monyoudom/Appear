/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 Popover view controller for choosing virtual objects to place in the AR scene.
 */

import UIKit
import AVKit

// MARK: - ObjectCell

class ObjectCell: UITableViewCell {
    
    static let reuseIdentifier = "ObjectCell"
    
    @IBOutlet weak var objectTitleLabel: UILabel!
    @IBOutlet weak var objectImageView: UIImageView!
    
}

// MARK: - VirtualObjectSelectionViewControllerDelegate

protocol VirtualObjectSelectionViewControllerDelegate: class {
    func virtualObjectSelectionViewController(_: VirtualObjectSelectionViewController, didSelectObjectAt index: Int)
    func virtualObjectSelectionViewController(_: VirtualObjectSelectionViewController, didDeselectObjectAt index: Int)
}

class VirtualObjectSelectionViewController: UITableViewController {
    
    private var selectedVirtualObjectRows = IndexSet()
    weak var delegate: VirtualObjectSelectionViewControllerDelegate?
    let labelTitle = ["Contant","Audio","Video"]
    let labelImage = ["contant","audio","video"]
    let ButtonID = ["Contantname","2","3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorEffect = UIVibrancyEffect(blurEffect: UIBlurEffect(style: .light))
    }
    
    override func viewWillLayoutSubviews() {
        preferredContentSize = CGSize(width: 250, height: tableView.contentSize.height)
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Check if the current row is already selected, then deselect it.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch indexPath.row {
        case 0:
            
            let vc = storyboard.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
            UIApplication.topViewController()?.present(vc, animated: true)
            
            
            break
        case 1:
            let vc = storyboard.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
            UIApplication.topViewController()?.present(vc, animated: true)
            break
        default:
//            let vc = storyboard.instantiateViewController(withIdentifier: "VideoController") as! VideoController
//            UIApplication.topViewController()?.present(vc, animated: true)
            
            if !contantCheck {
                if let path = Bundle.main.path(forResource: "c", ofType: "mp4")
                {
                    let video = AVPlayer(url:URL(fileURLWithPath: path))
                    let videoPlayer = AVPlayerViewController()
                    videoPlayer.player = video
                    present(videoPlayer, animated: true) {
                        video.play()
                    }
                }
                
            } else {
                if let path = Bundle.main.path(forResource: "angkorwatP", ofType: "mp4")
                {
                    let video = AVPlayer(url:URL(fileURLWithPath: path))
                    let videoPlayer = AVPlayerViewController()
                    videoPlayer.player = video
                    present(videoPlayer, animated: true) {
                        video.play()
                    }
                }
            }
            
            break
        }
        if indexPath.row == 0  {
            
        
        }
       
    }
        
        //Screen.goToContant(fromController: self, controollerName: labelTitle[indexPath.row] )
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelTitle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ObjectCell.reuseIdentifier, for: indexPath) as? ObjectCell else {
            fatalError("Expected `ObjectCell` type for reuseIdentifier \(ObjectCell.reuseIdentifier). Check the configuration in Main.storyboard.")
        }
        
        //cell.object = VirtualObjectManager.availableObjects[indexPath.row]
        cell.objectImageView.image = UIImage(named: labelImage[indexPath.row])
        cell.objectTitleLabel.text = labelTitle[indexPath.row]
        
        if selectedVirtualObjectRows.contains(indexPath.row) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = UIColor.clear
    }
    
}
