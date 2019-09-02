import UIKit
// : meaans we are inhereting from UIViewController
class CreateCollectableViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @IBOutlet weak var titleTextfield: UITextField!
          @IBOutlet weak var imageView: UIImageView!
           //pickerController is a property
            var pickerController = UIImagePickerController() // made  by apple for pics
               override func viewDidLoad() {
                 super.viewDidLoad()// gets called right when view controlle shows up for first time
                  //have a photos dsiplay inside of our app is called a delegate
                   pickerController.delegate = self
                    // Do any additional setup after loading the view.
                       }
        // this one is saying, someone took pick or discovered one from there folder, what shall we do next
         // this is a dictionary called info
          // Any is value-which can be boolean double whatever
          func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                // grab the image via dictioanry
                 // info is our dictioanry
                   // we are passing this into our image view to get it to show up
                    if let image = info[.originalImage] as? UIImage{//unwrapping
                      imageView.image = image
                        }
                         //dismiss pic after choosing it from 3rd screen
                           pickerController.dismiss(animated: true, completion: nil)
                            }
    @IBAction func mediaFolderTapped(_ sender: Any) {
                    pickerController.sourceType = .photoLibrary //related to clicking on camera icon
                     //if someone has tapped on media or camera
                      present(pickerController,animated: true, completion: nil)
                       }
    @IBAction func cameraTapped(_ sender: Any) {
                    pickerController.sourceType = .camera //related to clicking on camera icon
                     //if someone has tapped on media or camera
                      present(pickerController,animated: true, completion: nil)
                       }
    @IBAction func addTapped(_ sender: Any) {
                    // add collectable object to core data when clicking the Add button
                     if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                      //this makes a new collectable object
                       let collectable = Collectable(context: context)
                        collectable.title = titleTextfield.text
                         collectable.image = imageView.image?.jpegData(compressionQuality: 1.0)
                          //saving it to coredata
                           (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                             }
                              // aslso after they hit the Add button we want them to go back to the previous view controller
                               navigationController?.popViewController(animated: true)
                                }
                              }
