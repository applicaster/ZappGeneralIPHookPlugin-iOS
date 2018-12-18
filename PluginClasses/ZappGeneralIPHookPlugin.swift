//
//  ZappGeneralIPHookPlugin.swift
//  Zapp-App
//
//  Created by user on 17/12/2018.
//  Copyright © 2018 Applicaster LTD. All rights reserved.
//

import Foundation
import ZappPlugins

@objc public class ZappGeneralIPHookPlugin : NSObject, ZPAppLoadingHookProtocol {
    
    //MARK: - Consts variables
    public let entryPointKey = "entry_point"
    public let errorMessageKey = "unauthorized_message"
    public let authorizeIpArrayKey = "authorize_ip_array"
    
    public let errorMessageTextStyleKey = "text_style"
    public let errorMessageDialogBgColorKey = "dialog_bg_color"
    
    
    //MARK: - public variables
    public var configurationJSON: NSDictionary?
    
    //MARK: - Private variables
    private var ipResult: String? = nil
    
    //MARK: - Mandatory methods
    public required override init() {
        super.init()
    }
    
    public required convenience init(configurationJSON: NSDictionary?) {
        self.init()
        self.configurationJSON = configurationJSON
    }
    
    //MARK: - ZPAppLoadingHookProtocol implementation
    @objc public func executeOnApplicationReady(displayViewController: UIViewController?, completion: (() -> Void)?) {
        if let configuration = self.configurationJSON,
            let stringUrl = configuration[entryPointKey] as? String,
            !stringUrl.isEmpty,
            let url = NSURL(string: stringUrl) as URL?{
            sendURL(url: url, finished: { isSucceeded in
                if isSucceeded{
                    if self.checkValidation(){
                    completion?()
                    return
                    }
                }})
            }
        self.showErrorDialog()
    }
    
    //MARK: - Private Methods implementation
    private func showErrorDialog(){
        
    }
    
    private func checkValidation() -> Bool{
        if let configuration = self.configurationJSON,
            let ipsStringArray = configuration[authorizeIpArrayKey] as? String{
            let ipsArray = ipsStringArray.split(separator: ",")
            for ip in ipsArray{
                if String(ip) == self.ipResult{
                    return true
                }
            }
        }
        return false
    }

    
    private func sendURL(url:URL, finished: @escaping ((_ isSucceeded: Bool)->Void)){
        let request = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            if responseError != nil{
                print("Login Request failed with error: \(String(describing: responseError))")
                return finished(false)
            }

            // APIs usually respond with the data you just sent in your request
            if let data = responseData, let utf8Representation = String(data: data, encoding: .utf8) {
                print("response: ", utf8Representation)
                self.ipResult = utf8Representation
                return finished(true)
            } else {
                print("no readable data received in response")
                return finished(false)
            }
        }
        task.resume()
    }
}
