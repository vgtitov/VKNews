//
//  FeedViewController.swift
//  VKNews
//
//  Created by it10 on 27/01/2020.
//  Copyright © 2020 Viachaslau Tsitou. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    private let networkService: Networking = NetworkService()
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map({ (feedItem) in
                print(feedItem.date)
            })
        }
    }
}
