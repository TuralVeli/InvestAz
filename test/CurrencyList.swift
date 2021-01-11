//
//  CurrencyList.swift
//  test
//
//  Created by Tural Veliyev on 12/23/20.
//

import Foundation
import ObjectMapper
import SocketIO
class CurrencyList: Mappable {

    var code : String?
    var az : String?
    var ru : String?
    var en : String?
    var tr : String?

    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        
    
        code <- map["code"]
        az <- map["az"]
        ru <- map["ru"]
        en <- map["en"]
        tr <- map["tr"]
  
    }
    
}


class CurrencyListRate: Mappable {

    var from : String?
    var to : String?
    var result : Double?
    var date : String?
    var menbe : String?

    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        
    
        from <- map["from"]
        to <- map["to"]
        result <- map["result"]
        date <- map["date"]
        menbe <- map["menbe"]
  
    }
    
}


class WebsocketData: Mappable {

    var total : String?
    var result : [WebsocketDataResult]?
    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {

        total <- map["total"]
        result <- map["result"]

  
    }
    
}


class WebsocketDataResult: Mappable {

    var zero : String?
    var first :String?
    var third :String?
    var fourth :String?
    var fifth : String?
    var sixth :String?
    var seventh :String?
 
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        
    
        zero <- map["0"]
        first <- map["1"]
        third <- map["3"]
        fourth <- map["4"]
        fifth <- map["5"]
        sixth <- map["6"]
        seventh <- map["7"]
    }
    
}


//"0":"down","1":"FACEBOOK","2":"267.95","3":"268.00","4":"263.14","5":"268.85","6":5,"7":"2021-01-08T23:59:50.000Z"

//let serverURL = "https://q.investaz.az/live"
//
//class SocketOpration {
//
//    static let shared = SocketOpration(socketURL: URL(string: serverURL)!)
//
//    let socketURL: URL
//    var socket:SocketIOClient!
//    var manager:SocketManager!
//
//
//   init(socketURL: URL) {
//        self.socketURL = socketURL
//        self.manager = SocketManager(socketURL: self.socketURL, config: [.log(false)])
//        self.socket = self.manager.defaultSocket
//   }
//
//    func setup() {
//
//          socket.on(clientEvent: .connect) {[weak self] data, ack in
//              print("socket connected")
//          }
//
//          socket.on(clientEvent: .disconnect) {[weak self] data, ack in
//            print("socket disconnected")
//          }
//
//
//        // Get emit Call via On method ( emit will fire from Node )
//
//         socket.on("messages") { [weak self](data, ack) in
//            if data.count > 0 {
//                print(data)
//            }
//         }
//
//    }
//
//}
