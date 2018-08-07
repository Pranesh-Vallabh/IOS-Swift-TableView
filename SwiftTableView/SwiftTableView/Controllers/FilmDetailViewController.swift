//
//  FilmDetailViewController.swift
//  SwiftTableView
//
//  Created by Pranesh on 2018/08/06.
//  Copyright © 2018 Pranesh. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {

    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmDescription: UILabel!
    @IBOutlet weak var filmDirector: UILabel!
    @IBOutlet weak var filmProducer: UILabel!
    @IBOutlet weak var filmReleaseDate: UILabel!
    @IBOutlet weak var filmRottonTomatoesScore: UILabel!
    
    var filmSelected: Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmTitle.text = filmSelected?.title
        filmDescription.text = filmSelected?.description
        filmDirector.text = filmSelected?.director
        filmProducer.text = filmSelected?.producer
        filmReleaseDate.text = filmSelected?.releaseDate
        filmRottonTomatoesScore.text = filmSelected?.rottenTomatoesScore
    }

}
