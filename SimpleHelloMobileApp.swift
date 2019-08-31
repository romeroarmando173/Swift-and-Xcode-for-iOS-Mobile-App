import UIKit
class HelloTableViewController: UITableViewController {
                                                       // we gotta have a place to store all these 3 in our var
    var allHellos : [Hello] = []
    
    override func viewWillAppear(_ animated: Bool) {
                getHellos()                                       // 1. This is where we load the hellos
              }
    
    // this function will get all the hellos// it was created here first then put on viewdidLoad
    func getHellos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let hellos = try?
                context.fetch(Hello.fetchRequest()) {
                if let theHellos = hellos as? [Hello] {    // first time we see theHellos?
                    allHellos = theHellos
                    tableView.reloadData()                //this tells tableview that we need 2 rload cells
                }
            }
        }
    } // function getHellos() cloeses here
    
    @IBAction func helloTapped(_ sender: Any) {// 2.  Here we want to create hello when they hit the hello button
                if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                    let hello = Hello(context: context)
                    hello.name = "bye bye"
                    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                     getHellos() // this is the 3rd time we call this function
                  }
             } //function helloTapped closes here
    
    // 3. This is where we delete Hello// if someone deletes or taps one of these things
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let hello = allHellos[indexPath.row]
                    if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                        context.delete(hello)   //this is the hello they are trying to get rid of
                        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                        getHellos()            // this is getting all our hellos
                  }
             }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    return allHellos.count
                  }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    let cell = UITableViewCell() // when we create a cell
                    //we are getting a particular one in the array//did this lines first before we did hello.name below
                    let hello = allHellos[indexPath.row]    // this is the selected hello
                    cell.textLabel?.text = hello.name
                    return cell
                  }
                }
