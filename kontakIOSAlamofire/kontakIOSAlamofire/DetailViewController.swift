//
//  DetailViewController.swift
//  kontakIOSAlamofire
//
//  Created by SMK IDN MI on 11/13/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var labelID: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    
    var passid:String?
    var passname:String?
    var passemail:String?
    var passgender:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelID.text = passid
        labelName.text = passname
        labelEmail.text = passemail
        labelGender.text = passgender
        

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
