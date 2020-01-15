//
//  FollowerCellProvider.swift
//  GitHubFollowers
//
//  Created by TOOK on 09.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import Foundation
import CollectionKit

class FollowerCellProvider: BasicProvider<FollowerCell.Data, FollowerCell> {
    init(_ dataSource: ArrayDataSource<FollowerCell.Data>,
         tapHandler: ((BasicProvider<FollowerCell.Data, FollowerCell>.TapContext)->(Void))? = nil) {
        let sourceSize = ClosureSizeSource {(index: Int, data: FollowerCell.Data, collectionSize: CGSize) -> CGSize in
            let side = (collectionSize.width) / 3
            let height = side * 1.3
            return CGSize(width: side, height: height)
            
        }
        let sourceView = ClosureViewSource(viewUpdater: {(cell: FollowerCell, data: FollowerCell.Data, index: Int) in
            cell.configure(data: data)
        })
        
        let layout: CollectionKit.Layout
        layout = FlowLayout()
        
        super.init(
            dataSource: dataSource,
            viewSource: sourceView,
            sizeSource: sourceSize,
            layout: layout,
            animator: AnimatedReloadAnimator(),
            tapHandler: tapHandler
        )
    }
}
