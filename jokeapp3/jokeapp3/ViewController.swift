//
//  ViewController.swift
//  jokeapp3
//
//  Created by admin on 30/09/24.
//

import UIKit

class ViewController: UIViewController  {
    
    
    var jokeArr: [Jokemodel] = []
    
    
    @IBOutlet weak var tableview: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callJokeApi()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        
        
        // Do any additional setup after loading the view.
    }
    func callJokeApi(){
        
        ApiManager().fetchJokes{ result in
            switch result {
                
            case .success(let data):
                self.jokeArr.append(contentsOf: data)
                self.tableview.reloadData()
                print(self.jokeArr)
                
                
            case .failure(let failure):
                debugPrint("something went wrong in calling API\(failure)")
                
            }
        }
    }
}
    extension ViewController:UITableViewDelegate, UITableViewDataSource{
        func setup(){
            tableview.delegate=self
            tableview.dataSource=self
            tableview.register(UINib(nibName: "JokeCell", bundle: nil), forCellReuseIdentifier: "JokeCell")

        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return jokeArr.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell=tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as! JokeCell
            cell.typelabel.text=jokeArr[indexPath.row].type
            cell.setuplabel.text=jokeArr[indexPath.row].setup
            cell.punchlinelabel.text=jokeArr[indexPath.row].punchline
            return cell
            
        }
        
    }


