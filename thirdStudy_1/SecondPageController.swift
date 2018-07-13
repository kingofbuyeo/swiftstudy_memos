//
//  SecondPageController.swift
//  thirdStudy_1
//
//  Created by 김용철 on 2018. 6. 30..
//  Copyright © 2018년 김용철. All rights reserved.
//

import UIKit

class SecondPageController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goMainPageButton(_ sender: Any) {
        

        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func noDismissButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainPage") as! MainController;
        self.present(vc, animated: true, completion: nil)
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
