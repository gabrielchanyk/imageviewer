//
//  imageFetch.swift
//  image_viewer
//
//  Created by user196869 on 7/20/21.
//

import Foundation

class ImageFetch{
    //static variables are instantiated lazily
    static var imgItems = Items()
    static func fetchImg(index: Int, completion: @escaping (Data) -> Void)
    {
        let urlString = imgItems.listofImages[index].link
        guard let url = URL(string: urlString) else {return}
        let imgQ = DispatchQueue(label: "imgQ")
        
        imgQ.async {
            if let imgDat = try? Data(contentsOf: url){
                completion(imgDat)
            }
        }
    }
}
