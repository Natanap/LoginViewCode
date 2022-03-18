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
    var data:[DataUser] = [DataUser(name: "Caio", nameImage: "menino1"),
                           DataUser(name: "Gabi", nameImage: "menina1"),
                           DataUser(name: "Ze das quantas", nameImage: "menino2"),

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
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//  let color:[UIColor] = [.orange,.green,.red,.blue] // array de color
// let cell: UITableViewCell = UITableViewCell()
 //cell.backgroundColor = color[indexPath.row] com retorno
        let cell:UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
       
        cell?.setUpCell(data: self.data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
