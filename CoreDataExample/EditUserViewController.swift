//
//  EditUserViewController.swift
//  CoreDataExample
//
//  Created by MacStudent on 2018-11-12.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class EditUserViewController: UIViewController {
    
    var person: Person!

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    var context:NSManagedObjectContext!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        self.context = appDelegate.persistentContainer.viewContext
        
        textFieldEmail.text = self.person.name
        textFieldPassword.text = String(self.person.age)
    }
    
    @IBAction func buttonSaveChanges(_ sender: UIButton) {
        print("Save button pressed")
        
        var a = String(person.age)
        
        person.name = textFieldEmail.text!
        a = textFieldPassword.text!
        
        // sending the SAVE to the databse
        do {
            try self.context.save()
            print("Saved to database!")
        }
        catch {
            print("Error while saving to database")
        }
        
        
    }
}
