//
//  ViewController.swift
//  EreeniYakala
//
//  Created by Tolga on 27.02.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var sureLabel: UILabel!
    @IBOutlet weak var skorLabel: UILabel!
    @IBOutlet weak var yuksekSkorLabel: UILabel!
    @IBOutlet weak var eren1: UIImageView!
    @IBOutlet weak var eren2: UIImageView!
    @IBOutlet weak var eren3: UIImageView!
    @IBOutlet weak var eren4: UIImageView!
    @IBOutlet weak var eren5: UIImageView!
    @IBOutlet weak var eren6: UIImageView!
    @IBOutlet weak var eren7: UIImageView!
    @IBOutlet weak var eren8: UIImageView!
    @IBOutlet weak var eren9: UIImageView!
    
    var skor = 0
    var timer = Timer()
    var hideTimer = Timer()
    var sayac = 10
    var erenArray = [UIImageView]()
    var highScore = 0
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        var saveScore = UserDefaults.standard.object(forKey: "highScore")
        
        if let abc = saveScore as? Int {
            
            highScore = abc
            
        }
        
        if saveScore == nil {
            
            highScore = 0
            yuksekSkorLabel.text = "En Yüksek Skorunuz: \(highScore)"
            
        }
        
        if let highScore2 = saveScore as? Int {
            
            yuksekSkorLabel.text = "En Yüksek Skorunuz: \(highScore2)"
            
        }
        
        
        eren1.isUserInteractionEnabled = true
        eren2.isUserInteractionEnabled = true
        eren3.isUserInteractionEnabled = true
        eren4.isUserInteractionEnabled = true
        eren5.isUserInteractionEnabled = true
        eren6.isUserInteractionEnabled = true
        eren7.isUserInteractionEnabled = true
        eren8.isUserInteractionEnabled = true
        eren9.isUserInteractionEnabled = true
        
        
        let tiklama1 = UITapGestureRecognizer(target: self, action: #selector(skorArttirma))
        let tiklama2 = UITapGestureRecognizer(target: self, action: #selector(skorArttirma))
        let tiklama3 = UITapGestureRecognizer(target: self, action: #selector(skorArttirma))
        let tiklama4 = UITapGestureRecognizer(target: self, action: #selector(skorArttirma))
        let tiklama5 = UITapGestureRecognizer(target: self, action: #selector(skorArttirma))
        let tiklama6 = UITapGestureRecognizer(target: self, action: #selector(skorArttirma))
        let tiklama7 = UITapGestureRecognizer(target: self, action: #selector(skorArttirma))
        let tiklama8 = UITapGestureRecognizer(target: self, action: #selector(skorArttirma))
        let tiklama9 = UITapGestureRecognizer(target: self, action: #selector(skorArttirma))
        
        
        eren1.addGestureRecognizer(tiklama1)
        eren2.addGestureRecognizer(tiklama2)
        eren3.addGestureRecognizer(tiklama3)
        eren4.addGestureRecognizer(tiklama4)
        eren5.addGestureRecognizer(tiklama5)
        eren6.addGestureRecognizer(tiklama6)
        eren7.addGestureRecognizer(tiklama7)
        eren8.addGestureRecognizer(tiklama8)
        eren9.addGestureRecognizer(tiklama9)
        
        
        erenArray = [eren1, eren2, eren3, eren4, eren5, eren6, eren7, eren8, eren9]
        
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerfunc), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideeren), userInfo: nil, repeats: true)
        
        
        hideeren()
        
        
    }

    
    
    @objc func hideeren() {
        
        for levi in erenArray {
            levi.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(erenArray.count-1)))
        erenArray[random].isHidden = false
        
        
        
    }
    
    
    
    
    @objc func timerfunc() {
        
        sayac -= 1
        sureLabel.text = "\(sayac)"
        
        if sayac == 0 {
            
            timer.invalidate()
            hideTimer.invalidate()
            
            
            if skor > highScore {
                
                highScore = skor
                yuksekSkorLabel.text = "En Yüksek Skorun: \(highScore)"
                UserDefaults.standard.set(highScore, forKey: "highScore")
                
            }
            
            
            let alert = UIAlertController(title: "Süre Bitti", message: "Çıkmak İster misin?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.cancel, handler: nil)
            let tryButton = UIAlertAction(title: "Tekrar Oyna", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
                self .skor = 0
                self .sayac = 10
                self .skorLabel.text = "Skor: \(self.skor)"
                self .sureLabel.text = "\(self.sayac)"
                
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerfunc), userInfo: nil, repeats: true)
                
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideeren), userInfo: nil, repeats: true)
                
                
            }
            
            alert.addAction(okButton)
            alert.addAction(tryButton)
            self.present(alert, animated: true, completion: nil)
            
            for levi in erenArray {
                levi.isHidden = true
            }
            
            
            
            
        }
        
        
    }
    
    
    @objc func skorArttirma(){
        
        skor += 1
        
        skorLabel.text = "Skor: \(skor)"
        
    }
    
    
    
    
    
    
    
    
    

}

