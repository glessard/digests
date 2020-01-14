//
//  Digestable.swift
//  Digests
//
//  Created by Guillaume Lessard on 7/13/18.
//  Copyright © 2018 Guillaume Lessard. All rights reserved.
//

public protocol Digestable
{
  func hash<Algorithm: DigestAlgorithm>(into algorithm: inout Algorithm)
}

extension String: Digestable
{
  public func hash<Algorithm: DigestAlgorithm>(into algorithm: inout Algorithm)
  {
    if let data = data(using: .utf8)
    {
      algorithm.combine(with: data)
    }
  }
}

import struct Foundation.URL

extension URL: Digestable
{
  public func hash<Algorithm: DigestAlgorithm>(into algorithm: inout Algorithm)
  {
    absoluteString.hash(into: &algorithm)
  }
}
