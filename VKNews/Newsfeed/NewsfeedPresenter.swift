//
//  NewsfeedPresenter.swift
//  VKNews
//
//  Created by it10 on 23/03/2020.
//  Copyright (c) 2020 Viachaslau Tsitou. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
  func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
  weak var viewController: NewsfeedDisplayLogic?
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
  
  }
  
}
