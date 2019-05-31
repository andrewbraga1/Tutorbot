//
//  DisciplineDetailsViewController.swift
//  Tutorbot
//
//  Created by student on 30/05/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class DisciplineDetailsViewController: UIViewController {
    var discipline: Discipline?
    
    
    @IBOutlet weak var disciplineImage: UIImageView!
    
    @IBOutlet weak var disciplineDescription: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = discipline?.name
        disciplineDescription.text = discipline?.description
        disciplineImage.image = UIImage(contentsOfFile: discipline?.imagePath ?? "")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startDiscipline(_ sender: UIButton) {
        //Send bluetooth message
        
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
