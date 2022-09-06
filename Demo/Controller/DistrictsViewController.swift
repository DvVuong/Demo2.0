//
//  DistrictsViewController.swift
//  Demo
//
//  Created by admin on 22/08/2022.
//

import UIKit
class DistrictsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var code = 0
    var arrdistrict = [District]()
    var codeDistrict = [District]()
    var didselecDistricts: ((District) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        readData()
        setupTableDistrict()
        filterData()
    }
   private func readData(){
        let url = Bundle.main.url(forResource: "Districts", withExtension: "plist")!
        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode(DistrictResponse.self, from: data)
            self.arrdistrict = result.districts
        }
        catch {
            print(error)
        }
    }
    
   private func filterData(){
        for i in arrdistrict {
            if i.cityCode == code {
                codeDistrict.append(i)
            }
        }
    }
    private func setupTableDistrict(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}
extension DistrictsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return codeDistrict.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DistrictCell", for: indexPath)
        cell.textLabel?.text = codeDistrict[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didselecDistricts?(codeDistrict[indexPath.row])
        NotificationCenter.default.post(name: NSNotification.Name("Districts"), object: codeDistrict[indexPath.row])
        dismiss(animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
