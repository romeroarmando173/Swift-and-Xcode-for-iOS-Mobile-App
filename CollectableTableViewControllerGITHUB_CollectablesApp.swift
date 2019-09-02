import UIKit
class CollectableTableViewController: UITableViewController {
            // collecatbles here is property
              var collectables : [Collectable] = []
               // we want this to run everytime the view will appear
                override func viewWillAppear(_ animated: Bool) {
                getCollectables()
                         }
                        func getCollectables() {
                        // get access to our objects and tap into core data
                        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                            if let collectables = try?  // local constant
                                context.fetch(Collectable.fetchRequest()){
                                if let theCollectables = collectables as? [Collectable]{
                                    // referring to the class we are currently in
                                    self.collectables  = theCollectables // accessing property and not local constant
                                    //updating our tableview
                                    tableView.reloadData()
                                }
                            }
                        }
                    }
            override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                   // we need these 2 functions to talk about the array way above
                     return collectables.count
                                     }
            override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    let cell = UITableViewCell()
                        // we need to get access to collectable
                        let collectable = collectables[indexPath.row]
                            cell.textLabel?.text = collectable.title
                                //1. unwrap the data optional we have inside our collectable then take that....
                                  if let data = collectable.image {   //2. .... make a new UI image
                                   // this is an UIimage object
                                    //passing the pic into a smaller icon pic
                                     cell.imageView?.image = UIImage(data:data) //....3. then put inside imageView
                                       }
                                        return cell
                                         }
            override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                     //this is getting rid of the ugly grey line
                       // meaning if someone sleects one of these cells, go ahead and deselec
                         tableView.deselectRow(at: indexPath, animated: true)
                           }
                            //swipe to delete
            override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                //if someones trying to delelte something then lets go ahead and delete it
                  if editingStyle == .delete {
                     //delete when somene touches delete so we gotta have access to the context
                       if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                         //this is the collectible we are working with
                          let collectable = collectables[indexPath.row]
                            //passing the collectible inside of here
                             context.delete(collectable)
                              //save what we have in the coredata that it has been deleted
                               (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                                // this will refresh the tableviews and display the undeleted collectables
                                 getCollectables()
                                }
                            }
                        }
                     }
