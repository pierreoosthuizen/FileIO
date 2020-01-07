/*
 FileIO.swift

 Created by Pierre Oosthuizen on 2018/08/16.
 Copyright © 2018 Plouton Consulting. All rights reserved.

*/

import Foundation

/**
 Class allows reading from PList files into NSDictionary and NSArray.
 */
open class FileIO: NSObject
{
    /**
     Reads a plist file and returns the results in an array.
     
     - Parameter plistFile: The file to be read for array values.
     
     - Returns: A new string array containing all the values from the file.
     */
    public func readPListArray(plistFile: String)-> [String]
    {
        var arrayRecords: [String] = []
        
        if let fileURL = Bundle.main.url(forResource: plistFile, withExtension: "plist")
        {
            arrayRecords = NSArray(contentsOf: fileURL)! as! [String]
        }
    
        return (arrayRecords)
    }
    
    /**
     Reads a plist file and returns the results in a dictionary.
     
     - Parameter plistFile: The file to be read for dictionary values.
     
     - Returns: A new dictionary containing all the values from the file.
     */
    public func readPListDictionary(plistFile: String) -> NSDictionary
    {
        var dictRecords: NSDictionary = [:]
        
        if let fileURL = Bundle.main.url(forResource: plistFile, withExtension: "plist")
        {
            dictRecords = NSDictionary(contentsOf: fileURL)! as NSDictionary
        }
        
        return (dictRecords)
    }
    
    /**
     Reads a plist file and returns the results in either dictionary or array.
     
     - Parameter dataFile: The file to be read for dictionary values.
     
     - Returns: A new array or dictionary containing all the values from the file.
     */
    public func readPList<T>(dataFile: String) -> T
    {
        let fileURL = Bundle.main.url(forResource: dataFile, withExtension: "plist")
        let fileContent: T = NSDictionary(contentsOf: fileURL!) as! T
        
        return (fileContent)
    }
}
