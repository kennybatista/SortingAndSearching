//
//  MovieListViewController.swift
//  SearchingAndSorting
//
//  Created by Kenny Batista on 12/21/15.
//  Copyright © 2015 Kenny Batista. All rights reserved.
//

import UIKit

class MovieListViewController: UITableViewController {
    
    //3 ways to do arrays in Swift.
    //var movieList: [Movie] = [Movie]()
    
    var movieList = [Movie]()
    
    //var movieList3 = Array<Movie>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        movieList.append(Movie(titleValue: "Star Wars", grossingValue: 5032341.12));
        movieList.append(Movie(titleValue: "All is Lost", grossingValue: 5033.45));
        movieList.append(Movie(titleValue: "Peanuts", grossingValue: 5023.23));
        movieList.append(Movie(titleValue: "Steve Jobs", grossingValue: 5033.3));

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieIdentifier", forIndexPath: indexPath)

        // Configure the cell...
        
        let movie = movieList[indexPath.row]
        
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = String(movie.grossing);

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func searchButtonHit(sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Movie List", message: "Select Sort Option", preferredStyle: .Alert);
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel){ (action) in print(action)
        }
        
        alertController.addAction(cancelAction)
        
        
        let titleAction = UIAlertAction(title: "Sort by Title", style: .Default) { (action) in
            
            self.movieList.sortInPlace {
                
                let movie1:Movie = $0
                let movie2:Movie = $1
                
                return movie1.title.localizedCaseInsensitiveCompare(movie2.title) == NSComparisonResult.OrderedAscending
                
            }
            
            
            self.tableView.reloadData()
            
        }
        
        alertController.addAction(titleAction)
        
        
        
        
        //Sort by gross
        let grossAction = UIAlertAction(title: "Sort  by  Gross", style: .Default) { (action) in
            
            self.movieList.sortInPlace {
                
                let movie1:Movie = $0
                let movie2:Movie = $1
                
                return movie1.grossing < movie2.grossing
                
            }
            
            self.tableView.reloadData()
        }
        
        alertController.addAction(grossAction)
        
        
        
        //Search
        let searchAction = UIAlertAction(title: "Search", style: .Default){ (_) in
            print("Searching")
        }
        searchAction.enabled = true;
        alertController.addAction(searchAction);
        
        
        
        
        alertController.addTextFieldWithConfigurationHandler {
            (textField) in
            textField.placeholder = "Enter Something Here"
            textField.secureTextEntry = false
        }
    
    
        
        self.presentViewController(alertController, animated: true) {
            
        }
        
    
    }

}