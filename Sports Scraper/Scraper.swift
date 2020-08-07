//
//  Scraper.swift
//  Sports Scraper
//
//  Created by Kevin Escobedo on 8/6/20.
//  Copyright © 2020 Kevin Escobedo. All rights reserved.
//

import Foundation
import SwiftSoup

class Scraper
{
    let link: String
    
    init(link: String)
    {
        self.link = link
    }
    
    func scrapeTitle() -> Void
    {
        let temp = URL(string: self.link)
        guard let url = temp else {return}
        let html = try! String(contentsOf: url, encoding: .utf8)
        do
        {
            let doc: Document = try SwiftSoup.parseBodyFragment(html)
            let title = try doc.title()
            print("Title: \(title)")
        }
        
        catch Exception.Error(_, let message)
        {
            print("Error Message: \(message)")
        }
        
        catch
        {
            print("Something went wrong")
        }
    }
}
