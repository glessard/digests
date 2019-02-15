//
//  DigestAlgorithm.swift
//  Digests
//
//  Created by Guillaume Lessard on 7/13/18.
//  Copyright © 2018 Guillaume Lessard. All rights reserved.
//

import struct Foundation.Data

public protocol DigestAlgorithm
{
  init()
  mutating func combine(bytes: UnsafeRawBufferPointer)
  mutating func finalize() -> [UInt8]
}

extension DigestAlgorithm
{
  public mutating func combine(bytes: [UInt8])
  {
    bytes.withUnsafeBytes { combine(bytes: $0) }
  }

  public mutating func combine(with data: Data)
  {
#if swift(>=5.0)
    data.withUnsafeBytes { combine(bytes: $0) }
#else
    data.withUnsafeBytes { combine(bytes: UnsafeRawBufferPointer(start: $0, count: data.count)) }
#endif
  }

  public mutating func combine<T>(with bytesOf: UnsafeBufferPointer<T>)
  {
    combine(bytes: UnsafeRawBufferPointer(bytesOf))
  }
}

extension DigestAlgorithm
{
  public mutating func combine(with digestable: Digestable)
  {
    digestable.hash(into: &self)
  }

  public mutating func combine<I: BinaryInteger>(bytesOf integer: I)
  {
#if swift(>=4.2)
    withUnsafeBytes(of: integer) { combine(bytes: $0) }
#else
    var value = integer
    withUnsafeBytes(of: &value) { combine(bytes: $0) }
#endif
  }
}

// Convenient conversions from DigestAlgorithm to Digest

extension DigestAlgorithm
{
  public func digest() -> Digest
  {
    return Digest(self)
  }
}

extension DigestAlgorithm
{
  public static func digest(bytes: [UInt8]) -> Digest
  {
    return Digest(bytes: bytes, algorithm: Self.self)
  }

  public static func digest(data: Data) -> Digest
  {
    return Digest(data: data, algorithm: Self.self)
  }

  public static func digest(bytes: UnsafeRawBufferPointer) -> Digest
  {
    return Digest(bytes: bytes, algorithm: Self.self)
  }

  public static func digest<Value: Digestable>(value: Value) -> Digest
  {
    return Digest(value: value, algorithm: Self.self)
  }
}
