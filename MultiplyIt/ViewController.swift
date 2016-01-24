//
//  ViewController.swift
//  MultiplyIt
//
//  Created by Josh Christensen on 1/17/16.
//  Copyright © 2016 OrangeDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //vars
    
    var addingNum: Int = 0
    var lastNum: Int = 0
    var addingCurrently = false
    
    //Outlets
    
    @IBOutlet weak var AddIt: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var OutputLbl: UILabel!
    
    //Actions
    
    @IBAction func addBtnPressed(sender: AnyObject) {
        if textField.text != "" && addingCurrently == false {
            addingNum = Int(textField.text!)!
            lastNum = 0
            addingCurrently = true
            
            AddIt.hidden = true
            textField.hidden = true
            
            OutputLbl.hidden = false
            
            updateOutputLbl()
            
        } else if addingCurrently == true {
            
            updateOutputLbl()
            
            if lastNum >= 100 {
                stopGame()
            }
            
        }
        
        
    }
    
    //Functions
    
    func updateOutputLbl() {
        OutputLbl.text = "\(lastNum) + \(addingNum) = \(lastNum + addingNum)"
        lastNum += addingNum
    }
    
    func stopGame() {
        addingCurrently = false
        sleep(1)
        resetGame()
    }
    
    func resetGame() {
        lastNum = 0
        
        AddIt.hidden = false
        textField.hidden = false
        textField.text = ""
        
        OutputLbl.hidden = true
        
    }
    
    //Crap that was already here

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textField.delegate = self;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


}

