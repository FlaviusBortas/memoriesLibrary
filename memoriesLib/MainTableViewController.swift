//
//  MainTableViewController.swift
//  memoriesLib
//
//  Created by Flavius Bortas on 9/10/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    //MARK: - UI Elements
    
    //MARK: - Properties
    
    var memoriesList = Memory.allMemories
    var selectedMemory: Memory?
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoriesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Memory", for: indexPath)
        cell.textLabel?.text = "\(memoriesList[indexPath.row].title)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            memoriesList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedMemory = memoriesList[indexPath.row]
        
        performSegue(withIdentifier: goTo.details.rawValue, sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueId: String? = segue.identifier
        
        switch segueId {
        case goTo.details.rawValue:
            guard let showingDetails = segue.destination as? DetailsViewController else {return}
            showingDetails.currentMemory = selectedMemory
            
        case goTo.add.rawValue:
            guard let addingMemory = segue.destination as? AddMemoryTableViewController else {return}
            addingMemory.delegate = self
            
        default:
            return
        }
    }
}

extension MainTableViewController: addMemoryDelegate {
    func addMemoryToList(controller: AddMemoryTableViewController, memory: Memory) {
        memoriesList.append(memory)
    }
}
