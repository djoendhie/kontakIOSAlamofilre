//
//  KontakTableViewController.swift
//  kontakIOSAlamofire
//
//  Created by SMK IDN MI on 11/13/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

//import library
import UIKit
import Alamofire
import SwiftyJSON


class KontakTableViewController: UITableViewController {
    
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    
    var idselected:String?
    var nameSelected:String?
    var emailSelected:String?
    var genderSelected:String?
    
    let kontakURL = "http://api.androidhive.info/contacts/"

    var kontak = [Kontak]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //memanggil data jason menggunakan alamofire
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    //mengambil data Dari API loans

    
    //self sizingcell
    //mengatur tinggi row table menjadi 92
//    tableView.estimatedRowHeight = 92.0
//    //mengatur tinggi row table menjadi dimensi otomatis
//    tableView.rowHeight = UITableViewAutomaticDimension
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrRes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellKontak", for: indexPath) as! kontakTableViewCell
        
        var dict = arrRes[indexPath.row]
        cell.labelNama.text = dict["name"] as? String
        cell.labelEmail.text = dict["email"] as? String
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
//        if let indexPath = self.tableView.indexPathForSelectedRow {
//            let controller = segue.destination as! DetailViewController
//            let value = arrRes[indexPath.row]
//            controller.passname = value["name"] as! String
//             controller.passid = value["id"] as! String
//             controller.passemail = value["email"] as! String
//             controller.passgender = value["gender"] as! String
//        }
        
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "PassData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "PassData"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let kirimData = segue.destination as! DetailViewController
            //mengirimkan data ke masing2 variable
            //mengirimkan nama wisata
            kirimData.passid = idselected
            kirimData.passname = nameSelected
            kirimData.passemail = emailSelected
            kirimData.passgender = genderSelected
        }
    }
}
