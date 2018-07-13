//
//  MainController.swift
//  thirdStudy_1
//
//  Created by 김용철 on 2018. 6. 30..
//  Copyright © 2018년 김용철. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goSecondPageButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "secondPage") as! SecondPageController;
        vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.present(vc, animated: true, completion: onSuccess)
    }
    
    func onSuccess() {
        
        NSLog("화면 전환 완료")
        
    }
    @IBAction func openMessageAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Super Dev", message: "App is running.", preferredStyle: .actionSheet)
        
        let okayAction = UIAlertAction(title: "OK", style: .default, handler: moveToSecondPage)
        let noAction = UIAlertAction(title: "NO", style: .default, handler: nil)
        alertController.addAction(okayAction)
        alertController.addAction(noAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func moveToSecondPage(type : UIAlertAction) -> Void {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "secondPage") as! SecondPageController;
        vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.present(vc, animated: true, completion: onSuccess)
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
