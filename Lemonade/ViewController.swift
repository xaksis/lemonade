//
//  ViewController.swift
//  Lemonade
//
//  Created by Akshay Anand on 11/15/14.
//  Copyright (c) 2014 CrayonBytes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var my_money_lbl: UILabel!
    @IBOutlet weak var my_lemons_lbl: UILabel!
    @IBOutlet weak var my_ic_lbl: UILabel!
    @IBOutlet weak var lemon_sup_lbl: UILabel!
    @IBOutlet weak var ic_sup_lbl: UILabel!
    @IBOutlet weak var mix_lemon_lbl: UILabel!
    @IBOutlet weak var mix_ice_lbl: UILabel!
    
    var lemonade = LemonadeStand()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buyLemonPressed(sender: UIButton) {
        self.lemonade.buyLemon();
        self.updateUI()
    }

    @IBAction func sellLemonPressed(sender: UIButton) {
        self.lemonade.sellLemon()
        self.updateUI()
    }
    
    @IBAction func buyIcePressed(sender: UIButton) {
        self.lemonade.buyIce()
        self.updateUI()
    }
    
    @IBAction func sellIcePressed(sender: UIButton) {
        self.lemonade.sellIce()
        self.updateUI()
    }
    
    @IBAction func addLemonPressed(sender: UIButton) {
        self.lemonade.addLemon()
        self.updateUI()
    }
    
    @IBAction func removeLemonPressed(sender: UIButton) {
        self.lemonade.removeLemon()
        self.updateUI()
    }
    
    @IBAction func addIcePressed(sender: UIButton) {
        self.lemonade.addIce()
        self.updateUI()
    }
    
    @IBAction func removeIcePressed(sender: UIButton) {
        self.lemonade.removeIce()
        self.updateUI()
    }
    
    @IBAction func startPressed(sender: UIButton) {
        self.lemonade.startDay()
        self.updateUI()
    }
    
    func updateUI(){
        self.my_money_lbl.text = "$\(lemonade.money)"
        self.my_lemons_lbl.text = "\(lemonade.lemons)"
        self.my_ic_lbl.text = "\(lemonade.ice)"

        self.lemon_sup_lbl.text = "\(lemonade.lemons_bought)"
        self.ic_sup_lbl.text = "\(lemonade.ice_bought)"
        
        self.mix_lemon_lbl.text = "\(lemonade.lemon_mix)"
        self.mix_ice_lbl.text = "\(lemonade.ice_mix)"
    }
    
}

