//
//  MyMath.swift
//  MathLib
//
//  Created by o.korniienko on 16.08.22.
//

import Foundation
import Alamofire

public class MyMath{
    
    let serverDataResponses = DataResponses()
    
    public static func plus(number1:Int, number2: Int)->Int{
        return number1 + number2
    }
    
    public static func minus(number1:Int, number2: Int)->Int{
        return number1 - number2
    }
    
    public static func dividing(number1:Int, number2: Int)->Int{
        return number1 / number2
    }
    
    public static func multiplication(number1:Int, number2: Int)->Int{
        return number1 * number2
    }
    
    public static func xton(x:Int, n: Int)->Int{
        return x^n
    }
    
    func sendFunction1(fcm_Token: String, os_Type: String, os_Version: String, device_Type: String, device_Name: String, sdk_Version: String, X_Push_Session_Id: String, X_Push_Auth_Token:String){
        print("Start function pushUpdateRegistration")
        let semaphore = DispatchSemaphore(value: 0)
        
        let requestURL = "url"
        print("pushUpdateRegistration url string is \(requestURL)")
        
        
        let timeInterval =  NSDate().timeIntervalSince1970
        let timet = Int(round(timeInterval) as Double)
        print("pushUpdateRegistration request X-Hyber-Timestamp is \(String(timet))")
        
        let auth_token = X_Push_Auth_Token + ":" + String(timet)
        let sha256_auth_token = auth_token
        print(sha256_auth_token)
        
        let params =  [
            "fcmToken": fcm_Token,
            "osType": os_Type,
            "osVersion": os_Version,
            "deviceType": device_Type,
            "deviceName": device_Name,
            "sdkVersion": sdk_Version
            ] as Dictionary<String, AnyObject>
        
        let headersRequest: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "X-Hyber-Session-Id": X_Push_Session_Id,
            "X-Hyber-Timestamp": String(timet),
            "X-Hyber-Auth-Token": sha256_auth_token
        ]
        
        print(params)
        print(headersRequest)
        
        Task{
            serverDataResponses.response = await makePostRequest(headersRequest: headersRequest, params: params, url: requestURL)
            semaphore.signal()
        }
        semaphore.wait()
        
        let response = serverDataResponses.response
        print("pushUpdateRegistration response is \(String(describing: response))")
        
        
        if response != nil && response?.error == nil{
            
            print("pushUpdateRegistration response debugDescription is \(String(describing: response?.debugDescription))")
            print("pushUpdateRegistration response data is \(String(describing: response?.data))")
            let body_json: String = String(decoding: (response?.data)!, as: UTF8.self)
            print("pushUpdateRegistration body_json from push server: \(body_json)")
    
            
            var description = "Success"
            
            switch response?.response?.statusCode {
                case 401:
                    description = "Failed"
                    UserDefaults.standard.set(false, forKey: "registrationstatus")
                    UserDefaults.standard.synchronize()
                    print("pushUpdateRegistration response code is \(String(describing: response?.response!.statusCode))")
                default:
                    description = "Failed"
                print("pushUpdateRegistration response code is \(String(describing: response?.response!.statusCode))")
            }
            
            
        }
        
        
    }
    
    func sendFunctio2(message_Id: String, answer: String, X_Push_Session_Id: String,X_Push_Auth_Token:String) {
        
        let semaphore = DispatchSemaphore(value: 0)
    
        
        let requestURL = "url"
        print("sendMessaeCallBack url string is \(requestURL)")
        
        let timeInterval =  NSDate().timeIntervalSince1970
        let timet = Int(round(timeInterval) as Double)
        print("sendMessaeCallBack request X-Hyber-Timestamp is \(String(timet))")
        
        let auth_token = X_Push_Auth_Token + ":" + String(timet)
        let sha256_auth_token = auth_token
        print(sha256_auth_token)
        
        let params =  [
            "messageId": message_Id,
            "answer": answer
        ] as Dictionary<String, AnyObject>
        
        let headersRequest: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "X-Hyber-Session-Id": X_Push_Session_Id,
            "X-Hyber-Timestamp": String(timet),
            "X-Hyber-Auth-Token": sha256_auth_token
        ]
        print(params)
        print(headersRequest)
        Task{
            serverDataResponses.response = await makePostRequest(headersRequest:headersRequest, params: params, url: requestURL)
            semaphore.signal()
        }
        semaphore.wait()
        
        let response = serverDataResponses.response
        print("sendMessaeCallBack response is \(String(describing: response))")
        
        
        if response != nil && response?.error == nil{
            print("sendMessaeCallBack response data is \(String(describing:response?.data))")
            
            print("sendMessaeCallBack response debugDescription is\(String(describing: response?.debugDescription))")
            let body_json: String = String(decoding: (response?.data)!, as: UTF8.self)
            print("sendMessaeCallBack body_json from push server:\(body_json)")
        
            var description = "Success"
            
            switch response?.response?.statusCode {
                case 401:
                    description = "Failed"
                    
                    UserDefaults.standard.set(false, forKey: "registrationstatus")
                    UserDefaults.standard.synchronize()
                    
                    print("sendMessaeCallBack response code is\(String(describing: response?.response!.statusCode))")
                default:
                    description = "Failed"
                    print("sendMessaeCallBack response code is\(String(describing: response?.response!.statusCode))")
            }
            
        }
        
        
        
    }
    
    
    func makePostRequest(headersRequest: HTTPHeaders, params: Parameters, url: String) async -> DataResponse<String, AFError>{
        let task = AF.request(url, method: .post, parameters: params, encoding:JSONEncoding.default, headers: headersRequest){$0.timeoutInterval = 15}.serializingString()
        let response = await task.response
        //{$0.timeoutInterval = 30}
        return response
        
    }
    
    
    internal class DataResponses{
        
        var response : DataResponse<String, AFError>!
        
        
    }
}
