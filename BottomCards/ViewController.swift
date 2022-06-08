//
//  ViewController.swift
//  BottomCards
//
//  Created by Nodirbek on 07/06/22.
//

import UIKit
import BLTNBoard

class ViewController: UIViewController {
    
    private lazy var boardManager: BLTNItemManager = {
        let item = BLTNPageItem(title: "Push Notifications")
        item.image = UIImage(systemName: "bell.fill")
        item.actionButtonTitle = "Continue"
        item.alternativeButtonTitle = "Maybe later"
        item.descriptionText = "Would you like to get notifications from out company"
        item.actionHandler = { _ in
            self.didTapBoardButton()
        }
        item.alternativeHandler = { _ in
            self.didTapSkip()
        }
        
        return BLTNItemManager(rootItem: item)
    }()
    
    @IBOutlet var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.backgroundColor = .link
        myButton.tintColor = .white
    }
    
    @IBAction func didTapButton() {
        boardManager.showBulletin(above: self)
    }

    func didTapBoardButton(){
        print("Did Tap continue")
    }
    
     func didTapSkip(){
        boardManager.dismissBulletin(animated: true)
        print("Did tap Skip")
    }

}

