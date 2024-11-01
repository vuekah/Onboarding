//
//  ViewController.swift
//  Onboarding
//
//  Created by admin on 28/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let color: [Int] = [0xDAD3C8,0xFFE5DE, 0xDCF6E6]
    private var index: Int = 0
    private let titleMain : [String]  = ["Track your work and get the result","Stay organized with team ","Get notified when work happens"];
    private let subtitle:[String]=["Remember to keep track of your professional accomplishments.","But understanding the contributions our colleagues make to our teams and companies","Take control of notifications, collaborate live or on your own time"]
    @IBOutlet weak var mAvatar: UIImageView!
    @IBOutlet weak var mPageControl: UIPageControl!
    @IBOutlet weak var mTitleLabel: UILabel!
    @IBOutlet weak var mSubtitleLabel: UILabel!
    @IBOutlet weak var mSkipButton: UIButton!
    @IBOutlet weak var mNextButton: UIButton!
    @IBOutlet weak var mViewButton: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        changeUI(index)
        
    }
    private func initUI(){
        mNextButton.layer.cornerRadius=35
        mNextButton.layer.masksToBounds=true
        mViewButton.spacing=90
        mNextButton.setTitle("Next", for: .normal)
    }
    private func changeUI(_ index:Int)
    {
        mAvatar.image = UIImage(named: "s\(index+1)")
        view.layer.backgroundColor = UIColor(rgb: color[index]).cgColor
        mPageControl.currentPage = index
        mTitleLabel.text = titleMain[index]
        mSubtitleLabel.text = subtitle[index]
        
        if index == 2{
            mNextButton.setTitle("Start", for: .normal)
            mSkipButton.isHidden = true
        }
    }
    
    @IBAction func mSkipButton(_ sender: Any) {
        index = 2
        changeUI(index)
    }
    
    @IBAction func mNextButton(_ sender: Any) {
        if index < 2
        {
            index += 1
            
        }
        changeUI(index)
    }
    
    
    
    
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
