//
//  JobsViewController.swift
//  Demo
//
//  Created by admin on 06/09/2022.
//

import UIKit

class JobsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var clippingView: UIView! {
        didSet {
            clippingView.layer.cornerRadius = 10
            clippingView.layer.masksToBounds = true
        }
    }
    var job = [Jobs]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        redData()
        
    }
    private func redData(){
        let url = Bundle.main.url(forResource: "ServerData", withExtension: "json")!
        do
        {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(JobsData.self, from: data)
            self.job = result.job
        }
        catch
        {
            print(error)
        }
    }
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
                
    }
}
extension JobsViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return job.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobsCell", for: indexPath) as! JobsCell
        cell.updateUI(job[indexPath.section])
        //cell.backgroundColor = .brown
        
        
        return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as! AddressCell
            cell.lbAdress.text = job[indexPath.section].address// lấy dữ liệu theo section [indexPath.section
            //cell.backgroundColor = .brown
            
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SalaryCell", for: indexPath) as! SalaryCell
            cell.lbsalary.text = job[indexPath.section].salary
            //cell.backgroundColor = .brown
            return cell
        }
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "requirementCell", for: indexPath) as! requirementCell
            cell.lbrequirement.text = job[indexPath.section].requirement
            //cell.backgroundColor = .brown
           
            return cell
        }
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        header.backgroundColor = .brown
        header.layer.cornerRadius = 10
        header.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return header
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        
        footer.layer.cornerRadius = 10
        footer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        footer.layer.masksToBounds = true
        footer.backgroundColor = .brown
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 150
        }else {
            return 65
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
           cell.backgroundColor = UIColor.brown
//           let layer: CAShapeLayer = CAShapeLayer()
//           let pathRef:CGMutablePath = CGMutablePath()
//           let bounds: CGRect = cell.bounds.insetBy(dx:0,dy:0)
//           var addLine: Bool = false
//           if (indexPath.row == 0 && indexPath.row == tableView.numberOfRows(inSection: indexPath.section)-1) {
//               pathRef.addRoundedRect(in: bounds, cornerWidth: cornerRadius, cornerHeight: cornerRadius)
//               // CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius)
//           } else if (indexPath.row == 0) {
//               pathRef.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
//               pathRef.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.minY), tangent2End: CGPoint(x: bounds.midX, y: bounds.midY), radius: cornerRadius)
//               pathRef.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.minY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
//               pathRef.addLine(to:CGPoint(x: bounds.maxX, y: bounds.maxY) )
//               addLine = true
//           } else if (indexPath.row == tableView.numberOfRows(inSection: indexPath.section)-1) {
//               pathRef.move(to: CGPoint(x: bounds.minX, y: bounds.minY), transform: CGAffineTransform())
//               //                    CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds))
//               pathRef.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.midX, y: bounds.maxY), radius: cornerRadius)
//               pathRef.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
//               pathRef.addLine(to:CGPoint(x: bounds.maxX, y: bounds.minY) )
//           } else {
//               pathRef.addRect(bounds)
//
//               addLine = true
//           }
//           layer.path = pathRef
//           //layer.fillColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.8).cgColor
//        layer.fillColor = UIColor.brown.cgColor
//
//           if (addLine == true) {
//               let lineLayer: CALayer = CALayer()
//               let lineHeight: CGFloat = (1.0 / UIScreen.main.scale)
//               lineLayer.frame = CGRect(x:bounds.minX + 10 , y:bounds.size.height-lineHeight, width:bounds.size.width-10, height:lineHeight)
//               lineLayer.backgroundColor = tableView.separatorColor?.cgColor
//               layer.addSublayer(lineLayer)
//           }
//           let testView: UIView = UIView(frame: bounds)
//           testView.layer.insertSublayer(layer, at: 0)
//           testView.backgroundColor = UIColor.white
//           cell.backgroundView = testView
        
    }
    
}
    

