//
//  CitiesViewController.swift
//  Demo
//
//  Created by admin on 22/08/2022.
//

import UIKit
class CitiesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var cities = [City]()
    var didSelectedCity: ((City) ->Void)?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        readData()
        setuptableView()
    }
   private func readData(){
        let url = Bundle.main.url(forResource: "Cities", withExtension: "plist")!
        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode(CityRespone.self, from: data)
            //print(result)
            self.cities = result.cities
            //self.tableView.reloadData()
        }
        catch{
            print(error)
        }
    }
   private func setuptableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}
extension CitiesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if self.hiddenSection.contains(section){
//            return 0
//        }
        return cities.count
    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return cities.count
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0: return 5
//        case 1: return 1
//        default: return 10
//        }
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if cities[indexPath.section].isOpen {
            return UITableView.automaticDimension
        }else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didSelectedCity?(cities[indexPath.row])
        cities[indexPath.section].isOpen = !cities[indexPath.section].isOpen
        tableView.reloadSections([indexPath.section], with: .none)
        //dismiss(animated: true)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 60)
        header.backgroundColor = .red
        let lbHeader = UILabel()
        lbHeader.text = "City"
        lbHeader.font = UIFont.systemFont(ofSize: 30)
        header.addSubview(lbHeader)
        lbHeader.translatesAutoresizingMaskIntoConstraints = false
        lbHeader.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: 30).isActive = true
        lbHeader.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 0).isActive = true
        lbHeader.centerYAnchor.constraint(equalTo: header.centerYAnchor ).isActive = true
        let tapHeader = UITapGestureRecognizer(target: self, action: #selector(tapOnHeader))
        header.tag = section
        header.addGestureRecognizer(tapHeader)
//        let sectionButton = UIButton()
//        sectionButton.setTitle("Section", for: .normal)
//        sectionButton.backgroundColor = .systemRed
//        sectionButton.tag = section
//        header.addSubview(sectionButton)
//        sectionButton.translatesAutoresizingMaskIntoConstraints = false
//        sectionButton.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: 50).isActive = true
//        sectionButton.leadingAnchor.constraint(equalTo: header.leadingAnchor).isActive = true
//        sectionButton.addTarget(self, action: #selector(hideSection(sender:)), for: .touchUpInside)
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        footer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 60)
        footer.backgroundColor = .blue
        let lbfooter = UILabel()
        lbfooter.text = "City"
        lbfooter.font = UIFont.systemFont(ofSize: 30)
        footer.addSubview(lbfooter)
        lbfooter.translatesAutoresizingMaskIntoConstraints = false
        lbfooter.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: 30).isActive = true
        lbfooter.leadingAnchor.constraint(equalTo: footer.leadingAnchor).isActive = true
        lbfooter.centerYAnchor.constraint(equalTo: footer.centerYAnchor).isActive  = true
        return footer
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
    }
    
    @objc func tapOnHeader(sender: UITapGestureRecognizer){
        if let tag = sender.view?.tag {
           // print(tag)
            cities[tag].isOpen = !cities[tag].isOpen
            //print(cities[tag].isOpen)
            self.tableView.reloadData()
        }
    }
    @objc func hideSection(sender: UIButton){
        
    }
    
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footer = UILabel()
//        footer.backgroundColor = .brown
//        footer.text = "Footer Section \(section)"
//        return footer
//    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 44
//    }
}
