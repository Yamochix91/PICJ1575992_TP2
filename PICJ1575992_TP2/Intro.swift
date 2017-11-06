//
//  Intro.swift
//  PICJ1575992_TP2
//
//  Created by Etudiant on 17-10-25.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import UIKit

class Intro: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0){
            self.changerPage()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func changerPage(){
        performSegue(withIdentifier: "versMenuPrincipal", sender: nil)
    }
}

