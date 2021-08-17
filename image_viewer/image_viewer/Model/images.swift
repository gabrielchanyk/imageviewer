//
//  images.swift
//  image_viewer
//
//  Created by user196869 on 7/20/21.
//

import Foundation

struct Item{
    let name : String
    let link : String
}

class Items
{
    lazy var listofImages : [Item] = {
        return [Item(name: "Warship", link: "https://images.freeimages.com/images/large-previews/ccc/a-warship-in-the-bay-1636310.jpg"),
                Item(name: "Bunny", link: "https://images.freeimages.com/images/large-previews/815/xmas-bunny-1313404.jpg"),
                Item(name: "Intergrated Circuit" , link: "https://images.freeimages.com/images/large-previews/ca1/scsi-hd-1626366.jpg"),
                Item(name: "City" , link: "https://images.freeimages.com/images/large-previews/468/winter-wonderland-1383617.jpg"),
                Item(name: "Tree", link: "https://images.freeimages.com/images/large-previews/a0d/autumn-tree-1382832.jpg")]
    }()
}
