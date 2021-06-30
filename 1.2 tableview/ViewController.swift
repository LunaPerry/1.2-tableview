//
//  ViewController.swift
//  1.2 tableview
//
//  Created by Luna Perry on 6/30/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: Propeties
    
    let alienArray = [String](repeating: "👽 invading  🌎", count: 3)
    
    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 100
        return table
    }()
    
    
    //MARK: VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
    }
    
    
    //MARK: Table & Table delegates
    
    func setTable(){
        self.view.addSubview(table)
        table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        
        table.register(AlienCell.self, forCellReuseIdentifier: "AlienCell")
        table.delegate = self
        table.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "You are in section \(section)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alienArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlienCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row) \(alienArray[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let alertController = UIAlertController(title: "Hello", message: "You've tapped in the \(indexPath.row) row, from section \(indexPath.section)", preferredStyle: .alert)
      let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in

      }
      alertController.addAction(okAction)
      self.present(alertController, animated: true, completion: nil)
    }


}

