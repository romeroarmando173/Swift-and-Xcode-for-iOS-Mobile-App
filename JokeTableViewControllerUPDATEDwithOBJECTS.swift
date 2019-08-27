//
//  JokeTableViewController.swift
//  Joke Bank
//
//  Created by Milhouse Tattoos on 8/25/19.
//  Copyright © 2019 Estudie Ingles. All rights reserved.
//

import UIKit

class JokeTableViewController: UITableViewController {

    var jokes : [Joke] = []
    
    
    override func viewDidLoad() {  //this is what happens when the view controller shows up
        super.viewDidLoad()

        let joke1 = Joke()
        joke1.title = "Chicken"
        joke1.text = "Q: Why did the chicken cross the road?\n\n A: to get to the other side"
        
        let joke2 = Joke()
        joke2.title = "Horse"
        joke2.text = "A horse walks into a bar and the bar tender says: \"Why the long face"
        
        let joke3 = Joke()
        joke3.title = "Olives"
        joke3.text = "2 olives are on an olive tree branch playing around. One of the olives bumps the other and knocks him off the branch. His friend wobbles at the edge and shouts down: 'are you ok??'/n/n/n His friend on the ground squeaks out: 'Dont worry...olive.."
        
        let joke4 = Joke()
        joke4.title = "Racer"
        joke4.text = "Q: What did the hot dog say when he crossed the finsih line? \n\n A: Im the weiner!"
        jokes = [joke1, joke2,joke3,joke4]
    }

    
    
    
//
//
//    "A horse walks into a bar and the bar tender says: 'Why the long face'"
//           }
//    if joke == "Olives"{  //.text is how you fill in the label you created in storyboard
//        jokeLabel.text = "2 olives are on an olive tree branch playing around. One of the olives bumps the other and knocks him off the branch. His friend wobbles at the edge and shouts down: 'are you ok??'/n/n/n His friend on the ground squeaks out: 'Dont worry...olive.."
//    }
//
//    if joke == "Racer"{  //.text is how you fill in the label you created in storyboard
//        jokeLabel.text = "Q: What did the hot dog say when he crossed the finsih line? \n\n A: Im the weiner!"
//
//
//
//
//
//
    
    
    
   
                        //HOW MANY   this func will return how many rows of jokes

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return jokes.count   // .count tells us how many items will be inside the array "jokes"
    }

                    // WHAT GOES INSIDE- this code will get runned for every number of item in the array
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        
        cell.textLabel?.text = jokes[indexPath.row].text

        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){// FIRST if someone taps on joke, it will do this below
                   
                    let selectedJoke = jokes[indexPath.row]
                    
        performSegue(withIdentifier: "moveToJokeDefinition",sender: selectedJoke)
    
    }    // SECOND this code below will run
    
    override func prepare(for segue: UIStoryboardSegue, sender:    //sender is an object
        Any?) {
        if let jokeVC = segue.destination as?
            JokeDefinitionViewController{
            
            if let selectedJoke = sender as? Joke{   // Joke object
                jokeVC.joke = selectedJoke

            }
        }
    
     }
}
