//
//  ViewController2.swift
//  githubnotetaker-swift
//
//  Created by Nicu on 06/01/2018.
//  Copyright © 2018 Nicu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    
    var notes = [String]()
    var ref: DatabaseReference!
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        print("Hello World")
        ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
        
            for key in value!.allKeys as! [String] {
                if let note = value![key] as! String! {
                    print("value \(note)")
                    self.notes.append(note)
                }
            }
            self.tableview.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (notes.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = notes[indexPath.row]
        
        return cell
    }
    
    @IBAction func action(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        print("LOGED OUT")
        performSegue(withIdentifier: "segue2", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
