//
//  Second_ViewController.swift
//  Data_btn_project
//
//  Created by iroid on 15/11/22.
//  Copyright © 2022 iroid. All rights reserved.
//

import UIKit

class Second_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var myTable: UITableView!
    var studentarray: [StudentDetails] = []
    
    @IBOutlet weak var tableCell: New_TableViewCell!
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"new1")!)

        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.fetchdata()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Two", for: indexPath)as! New_TableViewCell
        let record = studentarray[indexPath.row]
        cell.labl1.text = record.rollno
        cell.labl2.text = record.name
        cell.labl3.text = record.marks
       //text = record.rollno! + " " + record.name! + " " + record.marks!
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete
        {
            let std = studentarray[indexPath.row]
            context.delete(std)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do
            {
                studentarray = try context.fetch(StudentDetails.fetchRequest())
                
            }
            catch
            {
                print("error")
            }
        }
        myTable.reloadData()
    }
    func fetchdata ()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do
        {
            studentarray = try context.fetch(StudentDetails.fetchRequest())
        }
        catch
        {
            print("error")
        }
        
    }
    
    

   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
