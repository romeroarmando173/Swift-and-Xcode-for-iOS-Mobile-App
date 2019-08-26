//
//  JokeDefinitionViewController.swift
//  Joke Bank
//
//  Created by Milhouse Tattoos on 8/25/19.
//  Copyright © 2019 Estudie Ingles. All rights reserved.
//

import UIKit

class JokeDefinitionViewController: UIViewController {

    var joke = ""// this will hold the joke we are talking about
    
    
    @IBOutlet weak var jokeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = joke   //title of joke displayed on phone
    
        if joke == "Chicken"{  //.text is how you fill in the label you created in storyboard
            jokeLabel.text = "Q: Why did the chicken cross the road?\n\n A: to get to the other side"
        }
        if joke == "Walk Into a Bar"{  //.text is how you fill in the label you created in storyboard
                   jokeLabel.text = "A horse walks into a bar and the bar tender says: 'Why the long face'"
               }
        if joke == "Olives"{  //.text is how you fill in the label you created in storyboard
            jokeLabel.text = "2 olives are on an olive tree branch playing around. One of the olives bumps the other and knocks him off the branch. His friend wobbles at the edge and shouts down: 'are you ok??'/n/n/n His friend on the ground squeaks out: 'Dont worry...olive.."
        }
        
        if joke == "Racer"{  //.text is how you fill in the label you created in storyboard
            jokeLabel.text = "Q: What did the hot dog say when he crossed the finsih line? \n\n A: Im the weiner!"
        }
    
    //var jokes = ["Chicken", "Walk Into a Bar", "Olives", "Racer"]

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
