//
//  ViewController.swift
//  expandableSection
//
//  Created by Resembrink Correa Egoavil on 11/10/19.
//  Copyright © 2019 Resembrink Correa Egoavil. All rights reserved.
//

import UIKit


struct cellData {
    
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
    
}

class TableViewController: UITableViewController {
    
    var tableViewData = [cellData]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData  =  [cellData(opened: false, title: "Paises", sectionData: ["Brasil", "Colombia", "Argentina"]),
                           cellData(opened: false, title: "Lugares", sectionData: ["Patagonia", "Salta", "Cordoba"]),
                           cellData(opened: false, title: "Visitantes", sectionData: ["Rodrigo", "Marcos", "Lautaro"]),
                           cellData(opened: false, title: "Movilidad", sectionData: ["Avion", "Bus", "Bicicleta"])
            ]
        
        
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true{
            return tableViewData[section].sectionData.count + 1
        }else{
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     
        
        let dataIndex = indexPath.row - 1
        
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].title
               cell.textLabel?.textColor = UIColor.black
            
            return cell
            
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            cell.textLabel?.textColor = UIColor.gray
            return cell
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none) // none es la  animacion
                
               // let indexPath = tableView.indexPathForSelectedRow() //optional, to get from any UIButton for example
             
                
            }else{
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                
                
            }
            
        }
        
        
        let rowSelected = indexPath.row
        
        if rowSelected > 0 {
            print("section: \(indexPath.section)")
            print("row: \(indexPath.row)")
        }
      
        
        
        
        
    
    
    }

}



