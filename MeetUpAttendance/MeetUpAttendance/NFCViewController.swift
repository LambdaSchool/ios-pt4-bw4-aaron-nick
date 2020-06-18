//
//  NFCViewController.swift
//  MeetUpAttendance
//
//  Created by Nicolas Rios on 6/17/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit
import CoreNFC



class NFCViewController: UIViewController, NFCNDEFReaderSessionDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
   
   
    var nfcSession: NFCNDEFReaderSession?
    
    
    @IBAction func ScanPressed(_ sender: Any) {
        nfcSession = NFCNDEFReaderSession.init(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        nfcSession?.begin()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("The session was invlidated: \(error.localizedDescription)")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        var result = ""
        for payload in messages[0].records{
            print("-> \(payload)")
            result += String.init(data: payload.payload.advanced(by: 3), encoding: .ascii) ?? "Format not supported"
        }
        DispatchQueue.main.async {
            self.textView.text = result
            
        }
        
        
        
    }
 
    
   
        
        
        
        
    }
