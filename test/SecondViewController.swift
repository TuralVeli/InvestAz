//
//  SecondViewController.swift
//  test
//
//  Created by Tural Veliyev on 1/11/21.
//

import UIKit
import SocketIO
import ObjectMapper

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var connectingLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var activityView: UIActivityIndicatorView?

    var currentList  = [WebsocketDataResult]()
    var manager:SocketManager?
    var socketIOClient:SocketIOClient!
    override func viewDidLoad() {
        super.viewDidLoad()
        ConnectToSocket()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.isHidden = true
        connectingLabel.textColor = .red
        connectingLabel.text = "Disconnect"
        showActivityIndicator()

    }
    
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    func ConnectToSocket() {

            manager = SocketManager(socketURL: URL(string: "https://q.investaz.az")!, config: [.log(true), .compress,.path("/live")])
            socketIOClient = manager?.defaultSocket

        socketIOClient.on("message") {data, ack in
            self.connectingLabel.textColor = .green
            self.connectingLabel.text = "Connect"
            guard let dict  = data[0] as? [String : Any] else {return}
                let report = Mapper<WebsocketData>().map(JSON: dict)
                self.tableView.isHidden = false
                self.currentList.removeAll()
                self.currentList +=  (report?.result)!
                self.tableView.reloadData()
                self.hideActivityIndicator()
            
                 }
            socketIOClient.on(clientEvent: .error) { (data, eck) in
                print("socket 44 error")
            }

            socketIOClient.on(clientEvent: .disconnect) { (data, eck) in
                print("socket 44 disconnect")
                self.connectingLabel.textColor = .red
                self.connectingLabel.text = "Disconnect"
            }

        socketIOClient.on(clientEvent: SocketClientEvent.reconnect) { (data, eck) in
            
                
                
            }

            socketIOClient.connect()
        }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SecondTableViewCell
        cell?.firstLabel.text = currentList[indexPath.row].third
        cell?.secondLabel.text = currentList[indexPath.row].fourth
        cell?.thirdLabel.text = currentList[indexPath.row].first

        return cell!
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164
    }

}


