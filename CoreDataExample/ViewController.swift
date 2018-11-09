//
//  ViewController.swift
//  CoreDataExample
//
//  Created by MacStudent on 2018-11-09.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    // MARK: CoreDta variables
    // ------------------------------
    var context:NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello World")
        
        
        // Setup your CoreData variable
        // ----------------------------------------
        
        // 1. Mandatory - copy and paste this
        // Explanation: try to create/initalize the appDelegate variable.
        // If creation fails, then quit the app
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // 2. Mandatory - initialize the context variable
        // This variable gives you access to the CoreData functions
        self.context = appDelegate.persistentContainer.viewContext
        
    }

   
    
    //MARK:- Add Actions

    @IBAction func buttonAddPressed(_ sender: UIButton) {
        print("Add button pressed")
        
        //1. Get data from textbox
        let x = nameTextField.text
        
        //2. Create a person object
        var p = Person(context: self.context)
        
        //3. Set the properties of the person object
        p.age = 40
        p.name = x
        
        //4. Save the person object to the database
        do{
            try self.context.save()
            print("Saved the person to the database")
        } catch {
            print("Error when saving to the database")
        }
        
        //5. Done
    }
    
    @IBOutlet weak var buttonLoadPressed: UIButton!
}

