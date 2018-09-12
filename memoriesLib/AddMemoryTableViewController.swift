//
//  AddMemoryTableViewController.swift
//  memoriesLib
//
//  Created by Flavius Bortas on 9/11/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import UIKit

protocol addMemoryDelegate: class {
    func addMemoryToList(controller: AddMemoryTableViewController, memory: Memory)
}

class AddMemoryTableViewController: UITableViewController {
    
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var dateLabel: UITextField!
    @IBOutlet weak var content: UITextView!
    
    weak var delegate: addMemoryDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        guard let newMemoryTitle = titleLabel.text, newMemoryTitle.isNotEmpty else {
            titleLabel.becomeFirstResponder()
            return
        }
        
        guard let newMemoryDate = dateLabel.text, newMemoryDate.isNotEmpty else {
            dateLabel.becomeFirstResponder()
            return
        }
        
        guard let newContent = content.text, newContent.isNotEmpty else {
            content.becomeFirstResponder()
            return
        }
        
        let newMemory = Memory(title: newMemoryTitle, date: newMemoryDate, content: newContent)
        delegate?.addMemoryToList(controller: self, memory: newMemory)
        
        navigationController?.popViewController(animated: true)
    }
}

extension String {
    var isNotEmpty: Bool {
    return !self.isEmpty
    }
}
