//
//  DetailsViewController.swift
//  memoriesLib
//
//  Created by Flavius Bortas on 9/10/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailsContent: UITextView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var titleTextfield: UITextField!
    
    
    var currentMemory: Memory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateTextField.text = currentMemory?.date
        titleTextfield.text = currentMemory?.title
        detailsContent.text = currentMemory?.content
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editTapped(_ sender: UIBarButtonItem) {
        if sender.title == editingStatus.edit.rawValue {
            sender.title = editingStatus.done.rawValue
            
            dateTextField.isEnabled = true
            titleTextfield.isEnabled = true
            detailsContent.isEditable = true
            
            dateTextField.becomeFirstResponder()
            
        } else {
            currentMemory?.content = detailsContent.text ?? ""
            currentMemory?.date = dateTextField.text ?? ""
            currentMemory?.title = titleTextfield.text ?? ""
            
            navigationController?.popViewController(animated: true)
        }
    }
    

}
