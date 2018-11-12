//
//  SearchResultViewController.swift
//  CoreDataExample
//
//  Created by MacStudent on 2018-11-12.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class SearchResultViewController: UIViewController {
    
    var searchData :String = ""
    var context:NSManagedObjectContext!

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded the second screen")
        // Do any additional setup after loading the view.
//        lblName.text = searchData
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        self.context = appDelegate.persistentContainer.viewContext
        
        
        let fetchRequest:NSFetchRequest<Person> = Person.fetchRequest()
        
        // WHERE email = "sagarsaini3993@gmail.com"
        fetchRequest.predicate = NSPredicate(format: "name == %@", self.searchData)
        
        do {
            // Send the "SELECT *" to the database
            //  results = variable that stores any "rows" that come back from the db
            // Note: The database will send back an array of User objects
            // (this is why I explicilty cast results as [User]
            let results = try self.context.fetch(fetchRequest) as [Person]
            
            if results.count == 1 {
                let x = results[0] as Person
                lblName.text = x.name
                lblAge.text = String(x.age)
            } else if results.count == 0 {
                lblName.text = "Error, no results found"
            } else if results.count > 1 {
                lblName.text = "Sorry more than 1 result found"
            }
            
            // Loop through the database results and output each "row" to the screen
            print("Number of items in database: \(results.count)")
            
            for x in results {
                print("User Email: \(String(describing: x.name))")
                print("User Password: \(x.age)")
                
            }
        }
        catch let error {
            print("Error when fetching from database\(error.localizedDescription)")
        }
        
        
        
    }


}
