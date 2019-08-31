
import UIKit

class CompleteViewController: UIViewController {     // this whole classboldens up the thing on to do list
   
    @IBOutlet weak var nameLabel: UILabel!
    
    var toDo : ToDo? = nil                 // creating new property
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // updating nameLabel
            if let toDo = toDo {
                if toDo.important {            // if this is important, mark it
                    if let name = toDo.name{
                        nameLabel.text = "❗️" + name
                              }
                            } else {
                            // normal
                                 nameLabel.text = toDo.name
                                 }
                               }
                            //this is our toDo object
                        //above: optional- if this works out pass the name if not nil
                      }
    
    @IBAction func completeTapped(_ sender: Any) {
        // Delete ToDo
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let toDo = toDo{                    // if somethings an optional we gotta do "if let"
                context.delete(toDo)
                        }
                         (UIApplication.shared.delegate as? AppDelegate)?.saveContext()    // this is for saving
                       }
                    // Pop back - this sends us back to main screen
               navigationController?.popViewController(animated: true)
            }// this closes this function
          }// this closes the class
