//
//  Digest.swift
//  Digests
//
//  Created by Guillaume Lessard on 7/13/18.
//  Copyright © 2018 Guillaume Lessard. All rights reserved.
//

import struct Foundation.Data

public struct Digest: Equatable
{
  public static let defaultAlgorithm = SHA512.self

  public let bytes: [UInt8]
  public var data: Data { return Data(bytes) }

  public func hexString() -> String
  {
    return bytes.reduce(into: "", { $0.append(String(format: "%02x", $1)) })
  }

  public init<Algorithm: DigestAlgorithm>(_ generator: Algorithm)
  {
    var state = generator
    bytes = state.finalize()
  }
}

extension Digest
{
  public init<Algorithm: DigestAlgorithm>(bytes: [UInt8], algorithm: Algorithm.Type)
  {
    var generator = Algorithm()
    generator.combine(bytes: bytes)
    self.bytes = generator.finalize()
  }

  public init<Algorithm: DigestAlgorithm>(data: Data, algorithm: Algorithm.Type)
  {
    var generator = Algorithm()
    generator.combine(with: data)
    bytes = generator.finalize()
  }

  public init<Algorithm: DigestAlgorithm>(bytes: UnsafeRawBufferPointer, algorithm: Algorithm.Type)
  {
    var generator = Algorithm()
    generator.combine(bytes: bytes)
    self.bytes = generator.finalize()
  }

  public init<Algorithm: DigestAlgorithm, Value: Digestable>(value: Value, algorithm: Algorithm.Type)
  {
    var generator = Algorithm()
    generator.combine(with: value)
    self.bytes = generator.finalize()
  }
}
