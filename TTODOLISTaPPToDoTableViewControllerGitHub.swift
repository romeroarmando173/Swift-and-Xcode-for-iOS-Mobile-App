import UIKit

class ToDoTableViewController: UITableViewController { //everything you see inside here is in this class!
      var toDos = [ToDo]()
      //before this is displayed it will get stuff from core data
      override func viewWillAppear(_ animated: Bool){
             getToDos()
        }
                                                           // this is grabbing the stuff from core data
    func getToDos(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                if let toDosFromCoreData = try?            //all coredata will be passed in this constant
                    context.fetch(ToDo.fetchRequest()){
                    if let tempToDos = toDosFromCoreData as? [ToDo]{
                        toDos = tempToDos
                           tableView.reloadData()            //telling tableview that it has new info
                          }
                        }
                      }
                    }
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return toDos.count
        }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            let currentToDo = toDos[indexPath.row]       //toDos was variable declared at beginning of class
            if currentToDo.important {                    // if this is important, mark it
                if let name = currentToDo.name{
                cell.textLabel?.text = "❗️" + name
                      }
                        } else {
                // normal listing for to do list
                cell.textLabel?.text = currentToDo.name
                   }
            return cell
        }
    // this is the function that gets called when someon taps on a table view cell
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             let selectedToDo = toDos[indexPath.row]
             performSegue(withIdentifier: "moveToComplete", sender: selectedToDo)
                 }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let createVC = segue.destination as?
                CreateToDoViewController {
                createVC.toDoTableVC = self
                    }
            // this pass forwards the ToDo object
            if let completeVC = segue.destination as? CompleteViewController{
                if let selectedToDo = sender as? ToDo { //unwrap here as ToDo object
                    completeVC.toDo = selectedToDo
            }
       }
   }
} // this closes the class
