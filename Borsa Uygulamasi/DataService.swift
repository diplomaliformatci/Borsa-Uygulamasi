//
//  DataService.swift
//  Deneme
//
//  Created by Can KINCAL on 24/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import Foundation


public class DataService {
    
    
    
    
    
    public class func getBultenDataWithSuccess(url: String,success: @escaping ((_ iTunesData: Data) -> Void )) {
        loadDataFromURL(url: URL(string: url)!) { (data, error) -> Void in
            print("Data started downloading")
            if let data = data {
                success(data)
            }
        }
    }
    
    public class func loadDataFromURL(url: URL, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        let loadDataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(nil, error)
            } else if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    let statusError = NSError(domain: "com.raywenderlich",
                                              code: response.statusCode,
                                              userInfo: [NSLocalizedDescriptionKey: "HTTP status code has unexpected value."])
                    completion(nil, statusError)
                } else {
                    completion(data, nil)
                }
            }
        }
        loadDataTask.resume()
    }
    
    
}
