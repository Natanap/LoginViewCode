//
//  SportTableViewCell.swift
//  LoginViewCode
//
//  Created by Natanael Alves Pereira on 22/03/22.
//

import UIKit

class SportTableViewCell: UITableViewCell {

    static let identifier:String = "SportTableViewCell"
    var data:[Sport] = []
    
    var sportTableViewCellScreen: SportTableViewCellScreen = SportTableViewCellScreen()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview()
        self.configConstraints()
        self.sportTableViewCellScreen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview(){
        self.sportTableViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.sportTableViewCellScreen)
    }
    
    public func dataCollection(data:[Sport]){
        self.data = data
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            self.sportTableViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.sportTableViewCellScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.sportTableViewCellScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.sportTableViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

extension SportTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:SportCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.identifier, for: indexPath) as? SportCollectionViewCell
        cell?.setupCell(data: self.data[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    //Altura e largura da view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 100)
    }
    
}
