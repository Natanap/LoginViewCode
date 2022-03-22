//
//  HomeVCViewController.swift
//  LoginViewCode
//
//  Created by Natanael Alves Pereira on 16/03/22.
//

import UIKit
import nanopb

class HomeVC: UIViewController {

    // chamando a variavel home
    var homeScreen:HomeScrenn?
    var dataUser:[DataUser] = [DataUser(name: "Caio", nameImage: "menino1"),
                           DataUser(name: "Gabi", nameImage: "menina1"),
                           DataUser(name: "Ze das quantas", nameImage: "menino2"),

    ]
    var dataSport:[Sport] = [Sport(name: "Corrida", nameImage: "menino1"),
                             Sport(name: "Natacao", nameImage: "menino2"),
                             Sport(name: "Volei", nameImage: "menino2"),
    ]
    
    override func loadView() {
        self.homeScreen = HomeScrenn()
        self.view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assinatura do protocolo passando a responsabilidade
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }

}

extension HomeVC: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //numero de celular
        return self.dataUser.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//  let color:[UIColor] = [.orange,.green,.red,.blue] // array de color
// let cell: UITableViewCell = UITableViewCell()
 //cell.backgroundColor = color[indexPath.row] com retorno
        
        if indexPath.row == 3{
            let cell:SportTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            cell?.dataCollection(data: self.dataSport)
            return cell ?? UITableViewCell()
        }
        let cell:UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
       
        cell?.setUpCell(data: self.dataUser[indexPath.row])
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
