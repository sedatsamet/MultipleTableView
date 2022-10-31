//
//  ViewController.swift
//  MultipleTableView
//
//  Created by Sedat Samet Oypan on 24.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    let list1 = [1,3,5,7,9]
    let list2 = [0,2,4,6,8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView1.delegate = self
        tableView1.dataSource = self
        
        tableView2.delegate = self
        tableView2.dataSource = self
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    // Toplam veri ne kadar olucak (satır sayısı).
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tableView1 {
            return list1.count
        }
        return list2.count
    }
    // Cell içeriğini belirlemek
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        
        if tableView == tableView1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "oddNumberCell", for: indexPath)
            cell?.textLabel?.text = String(list1[indexPath.row])
        }
        if tableView == tableView2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "evenNumberCell", for: indexPath)
            cell?.textLabel?.text = String(list2[indexPath.row])
        }
        return cell!
    }
}

