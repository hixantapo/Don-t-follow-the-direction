//
//  ViewController.swift
//  Don't follow the direction
//
//  Created by Boting Wang on 2021/1/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerScoreLabel: UILabel! // 玩家分數顯示
    @IBOutlet weak var theirScoreLabel: UILabel! // 高木&西片分數顯示
    @IBOutlet weak var playerImage: UIImageView! // 玩家出手指頭圖片
    @IBOutlet weak var theirImage: UIImageView! // 高木&西片轉頭圖片
    @IBOutlet weak var currentResultLabel: UILabel! // 顯示目前的輸或贏
    @IBOutlet weak var playAgainButton: UIButton! // 再玩一次按鈕
    @IBOutlet weak var fingerUpButton: UIButton! // 手指向上按鈕
    @IBOutlet weak var fingerDownButton: UIButton! // 手指向下按鈕
    @IBOutlet weak var fingerRightButton: UIButton! // 手指向右按鈕
    @IBOutlet weak var fingerLeftButton: UIButton! // 手指向左鈕
    
    var playerScoreNumber = 0
    var theirScoreNumber = 0
    
    let theirHeading = ["head up", "head down", "head right", "head left"]
    let fingerPointing = ["finger up", "finger down", "finger right", "finger left"]
    let wordsOfResults = ["耶！得1分", "喔不！高木&西片得1分"]
    
    // 讓對方轉頭的圖片隨機出現
    func picRandom() {
        theirImage.image = UIImage(named: theirHeading.randomElement()!)
    }
    
    func showResult() {
        // 手指向上
        if playerImage.image == UIImage(named: fingerPointing[0]) {
            if theirImage.image == UIImage(named: theirHeading[0]) {
                currentResultLabel.text = wordsOfResults[0]
            } else {
                currentResultLabel.text = wordsOfResults[1]
            }
        }
        
        // 手指向下
        if playerImage.image == UIImage(named: fingerPointing[1]) {
            if theirImage.image == UIImage(named: theirHeading[1]) {
                currentResultLabel.text = wordsOfResults[0]
            } else {
                currentResultLabel.text = wordsOfResults[1]
            }
        }
        
        // 手指向右
        if playerImage.image == UIImage(named: fingerPointing[2]) {
            if theirImage.image == UIImage(named: theirHeading[2]) {
                currentResultLabel.text = wordsOfResults[0]
            } else {
                currentResultLabel.text = wordsOfResults[1]
            }
        }
        
        // 手指向左
        if playerImage.image == UIImage(named: fingerPointing[3]) {
            if theirImage.image == UIImage(named: theirHeading[3]) {
                currentResultLabel.text = wordsOfResults[0]
            } else {
                currentResultLabel.text = wordsOfResults[1]
            }
        }
    }
    
    func score() {
        if currentResultLabel.text == wordsOfResults[0] {
            playerScoreNumber += 1
            playerScoreLabel.text = "\(playerScoreNumber)"
        } else {
            theirScoreNumber += 1
            theirScoreLabel.text = "\(theirScoreNumber)"
        }
        
        // alert
        if playerScoreNumber == 5 {
            let alertController = UIAlertController(title: "遊戲結束", message: "你贏了！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "好", style: .default, handler: {(action: UIAlertAction!) -> Void in})
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            playAgainButton.isHidden = false
            fingerUpButton.isHidden = true
            fingerDownButton.isHidden = true
            fingerRightButton.isHidden = true
            fingerLeftButton.isHidden = true
            currentResultLabel.isHidden = true
            theirImage.image = UIImage(named: "mad face.jpg")
            playerImage.image = UIImage(named: "yeah.png")
        } else if theirScoreNumber == 15 {
            let alertController = UIAlertController(title: "遊戲結束", message: "你輸了！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "好", style: .default, handler: {(action: UIAlertAction!) -> Void in})
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            playAgainButton.isHidden = false
            fingerUpButton.isHidden = true
            fingerDownButton.isHidden = true
            fingerRightButton.isHidden = true
            fingerLeftButton.isHidden = true
            currentResultLabel.isHidden = true
            theirImage.image = UIImage(named: "win face.jpg")
            playerImage.image = UIImage(named: "cry face.png")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerScoreLabel.text = "0"
        theirScoreLabel.text = "0"
        currentResultLabel.text = nil
        playAgainButton.isHidden = true
        theirImage.image = UIImage(named: "Takagi & Nishikata.jpg")
    }

    @IBAction func fingerUp(_ sender: Any) { // 手指向上按鈕
        playerImage.image = UIImage(named: fingerPointing[0])
        picRandom()
        showResult()
        score()
    }
    @IBAction func fingerDown(_ sender: Any) { // 手指向下按鈕
        playerImage.image = UIImage(named: fingerPointing[1])
        picRandom()
        showResult()
        score()
    }
    @IBAction func fingerRight(_ sender: Any) { // 手指向右按鈕
        playerImage.image = UIImage(named: fingerPointing[2])
        picRandom()
        showResult()
        score()
    }
    @IBAction func fingerLeft(_ sender: Any) { // 手指向左按鈕
        playerImage.image = UIImage(named: fingerPointing[3])
        picRandom()
        showResult()
        score()
    }
    @IBAction func playAgain(_ sender: Any) { // 再玩一次按鈕
        playerScoreNumber = 0
        theirScoreNumber = 0
        playerScoreLabel.text = "\(playerScoreNumber)"
        theirScoreLabel.text = "\(theirScoreNumber)"
        currentResultLabel.text = nil
        playAgainButton.isHidden = true
        fingerUpButton.isHidden = false
        fingerDownButton.isHidden = false
        fingerRightButton.isHidden = false
        fingerLeftButton.isHidden = false
        currentResultLabel.isHidden = false
        playerImage.image = nil
        theirImage.image = UIImage(named: "Takagi & Nishikata.jpg")
    }
    
}

