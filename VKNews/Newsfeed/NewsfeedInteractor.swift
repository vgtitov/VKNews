//
//  NewsfeedInteractor.swift
//  VKNews
//
//  Created by it10 on 23/03/2020.
//  Copyright (c) 2020 Viachaslau Tsitou. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

  var presenter: NewsfeedPresentationLogic?
  var service: NewsfeedService?
  
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
  }
  
}
