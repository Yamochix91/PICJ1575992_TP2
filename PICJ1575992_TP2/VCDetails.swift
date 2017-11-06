//
//  VCDetails.swift
//  PICJ1575992_TP2
//
//  Created by Etudiant on 17-11-06.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import UIKit

class VCDetails: UIViewController {
    @IBAction func retourALaListe(_ sender: AnyObject) {
        var tableauDonnees=[Array<String>]()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var tableauDonnees=[Array<String>]()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
