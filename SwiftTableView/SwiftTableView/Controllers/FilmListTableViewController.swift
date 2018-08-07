//
//  FilmListTableViewController.swift
//  SwiftTableView
//
//  Created by Pranesh on 2018/08/06.
//  Copyright © 2018 Pranesh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FilmListTableViewController: UITableViewController {
    var films = [Film]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFilmData()
    }
    
    func getFilmData(){
        let apiClient = ApiClient()
        
        apiClient.getFilms() { (retrivedFilms, error) -> Void in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let retrivedFilms = retrivedFilms {
                self.films = retrivedFilms
                self.tableView.reloadData()
            }
        }
    }
    
}

extension FilmListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.FilmTableViewCellIdentifier, for: indexPath) as! FilmTableViewCell
        cell.titleLabel.text = films[indexPath.row].title
        return cell
    }
}

extension FilmListTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.SegueIdentifier {
            guard let filmDetailViewController = segue.destination as? FilmDetailViewController else {
                return
            }
            
            guard let filmTableViewCell = sender as? FilmTableViewCell else {
                return
            }
            
            guard let indexPath = tableView.indexPath(for: filmTableViewCell) else {
                return
            }
            
            filmDetailViewController.filmSelected = films[indexPath.row]
        }
    }
}

