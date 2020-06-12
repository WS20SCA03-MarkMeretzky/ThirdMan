//
//  CastTableViewController.swift
//  ThirdMan
//
//  Created by Mark Meretzky on 6/12/20.
//  Copyright © 2020 New York University School of Professional Studies. All rights reserved.
//

import UIKit;
import SafariServices;

struct Actor {
    let name: String;
    let role: String;
}

class CastTableViewController: UITableViewController {
    let actors: [Actor] = [
        Actor(name: "Hedwig Bleibtreu",   role: "Anna’s old landlady"),
        Actor(name: "Siegfried Breuer",   role: "Popescu"),
        Actor(name: "Joseph Cotten",      role: "Holly Martins"),
        Actor(name: "Ernst Deutsch",      role: "“Baron” Kurtz"),
        Actor(name: "Paul Hörbiger",      role: "Karl"),
        Actor(name: "Trevor Howard",      role: "Major Calloway"),
        Actor(name: "Wilfrid Hyde-White", role: "Crabbin"),
        Actor(name: "Bernard Lee",        role: "Sergeant Paine"),
        Actor(name: "Alida Valli",        role: "Anna Schmidt"),
        Actor(name: "Orson Welles",       role: "Harry Lime"),
        Actor(name: "Erich Ponto",        role: "Dr. Winkel")
    ];

    override func viewDidLoad() {
        super.viewDidLoad();

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section == 0 else {
            fatalError("table contains no section number \(section)");
        }
        //the number of rows
        return actors.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section == 0 else {
            fatalError("table contains no section number \(indexPath.section)");
        }

        guard (0 ..< actors.count).contains(indexPath.row) else {
            fatalError("section \(indexPath.section) contains no cell number \(indexPath.row)");
        }

        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "castCell", for: indexPath)

        // Configure the cell...
        let actor: Actor = actors[indexPath.row];
        cell.textLabel?.text = actor.name;
        cell.detailTextLabel?.text = "as \(actor.role)";
        return cell;
    }
    
    // MARK: - Protocol UITableViewControllerDelegate

    //Called when a cell is tapped.

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name: String = actors[indexPath.row].name;
        var urlComponents: URLComponents = URLComponents();
        urlComponents.scheme = "https";
        urlComponents.host = "en.wikipedia.org"; //English
        urlComponents.path = "/wiki/\(name)";    //will change " " to "%20"

        guard let url: URL = urlComponents.url else {
            fatalError("could not create url for state \(name)");
        }

        let safariViewController: SFSafariViewController = SFSafariViewController(url: url);
        present(safariViewController, animated: true);
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
