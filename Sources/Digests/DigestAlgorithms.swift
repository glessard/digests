//
//  DigestAlgorithms.swift
//  Digests
//
//  Created by Guillaume Lessard on 7/13/18.
//  Copyright © 2018 Guillaume Lessard. All rights reserved.
//

#if canImport(CommonCrypto)
import CommonCrypto
#else
#if swift(>=4.2)
#error("This package requires CommonCrypto")
#endif
#endif

public struct MD2: DigestAlgorithm
{
  private var state = CC_MD2state_st()
  private var finalized = false

  public init()
  {
    CC_MD2_Init(&state)
  }

  public mutating func combine(bytes: UnsafeRawBufferPointer)
  {
    assert(!finalized, "attempted to add to a finalized DigestAlgorithm in \(#function)")
    CC_MD2_Update(&state, bytes.baseAddress, CC_LONG(bytes.count))
  }

  public mutating func finalize() -> [UInt8]
  {
    assert(!finalized, "attempted to finalize a finalized DigestAlgorithm in \(#function)")
    var bytes = Array<UInt8>(repeating: 0, count: Int(CC_MD2_DIGEST_LENGTH))
    CC_MD2_Final(&bytes, &state)
    finalized = true
    return bytes
  }
}

public struct MD4: DigestAlgorithm
{
  private var state = CC_MD4state_st()
  private var finalized = false

  public init()
  {
    CC_MD4_Init(&state)
  }

  public mutating func combine(bytes: UnsafeRawBufferPointer)
  {
    assert(!finalized, "attempted to add to a finalized DigestAlgorithm in \(#function)")
    CC_MD4_Update(&state, bytes.baseAddress, CC_LONG(bytes.count))
  }

  public mutating func finalize() -> [UInt8]
  {
    assert(!finalized, "attempted to finalize a finalized DigestAlgorithm in \(#function)")
    var bytes = Array<UInt8>(repeating: 0, count: Int(CC_MD4_DIGEST_LENGTH))
    CC_MD4_Final(&bytes, &state)
    finalized = true
    return bytes
  }
}

public struct MD5: DigestAlgorithm
{
  private var state = CC_MD5state_st()
  private var finalized = false

  public init()
  {
    CC_MD5_Init(&state)
  }

  public mutating func combine(bytes: UnsafeRawBufferPointer)
  {
    assert(!finalized, "attempted to add to a finalized DigestAlgorithm in \(#function)")
    CC_MD5_Update(&state, bytes.baseAddress, CC_LONG(bytes.count))
  }

  public mutating func finalize() -> [UInt8]
  {
    assert(!finalized, "attempted to finalize a finalized DigestAlgorithm in \(#function)")
    var bytes = Array<UInt8>(repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
    CC_MD5_Final(&bytes, &state)
    finalized = true
    return bytes
  }
}

public struct SHA1: DigestAlgorithm
{
  private var state = CC_SHA1state_st()
  private var finalized = false

  public init()
  {
    CC_SHA1_Init(&state)
  }

  public mutating func combine(bytes: UnsafeRawBufferPointer)
  {
    assert(!finalized, "attempted to add to a finalized DigestAlgorithm in \(#function)")
    CC_SHA1_Update(&state, bytes.baseAddress, CC_LONG(bytes.count))
  }

  public mutating func finalize() -> [UInt8]
  {
    assert(!finalized, "attempted to finalize a finalized DigestAlgorithm in \(#function)")
    var bytes = Array<UInt8>(repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
    CC_SHA1_Final(&bytes, &state)
    finalized = true
    return bytes
  }
}

public struct SHA224: DigestAlgorithm
{
  private var state = CC_SHA256state_st()
  private var finalized = false

  public init()
  {
    CC_SHA224_Init(&state)
  }

  public mutating func combine(bytes: UnsafeRawBufferPointer)
  {
    assert(!finalized, "attempted to add to a finalized DigestAlgorithm in \(#function)")
    CC_SHA224_Update(&state, bytes.baseAddress, CC_LONG(bytes.count))
  }

  public mutating func finalize() -> [UInt8]
  {
    assert(!finalized, "attempted to finalize a finalized DigestAlgorithm in \(#function)")
    var bytes = Array<UInt8>(repeating: 0, count: Int(CC_SHA224_DIGEST_LENGTH))
    CC_SHA224_Final(&bytes, &state)
    finalized = true
    return bytes
  }
}

public struct SHA256: DigestAlgorithm
{
  private var state = CC_SHA256state_st()
  private var finalized = false

  public init()
  {
    CC_SHA256_Init(&state)
  }

  public mutating func combine(bytes: UnsafeRawBufferPointer)
  {
    assert(!finalized, "attempted to add to a finalized DigestAlgorithm in \(#function)")
    CC_SHA256_Update(&state, bytes.baseAddress, CC_LONG(bytes.count))
  }

  public mutating func finalize() -> [UInt8]
  {
    assert(!finalized, "attempted to finalize a finalized DigestAlgorithm in \(#function)")
    var bytes = Array<UInt8>(repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    CC_SHA256_Final(&bytes, &state)
    finalized = true
    return bytes
  }
}

public struct SHA384: DigestAlgorithm
{
  private var state = CC_SHA512state_st()
  private var finalized = false

  public init()
  {
    CC_SHA384_Init(&state)
  }

  public mutating func combine(bytes: UnsafeRawBufferPointer)
  {
    assert(!finalized, "attempted to add to a finalized DigestAlgorithm in \(#function)")
    CC_SHA384_Update(&state, bytes.baseAddress, CC_LONG(bytes.count))
  }

  public mutating func finalize() -> [UInt8]
  {
    assert(!finalized, "attempted to finalize a finalized DigestAlgorithm in \(#function)")
    var bytes = Array<UInt8>(repeating: 0, count: Int(CC_SHA384_DIGEST_LENGTH))
    CC_SHA384_Final(&bytes, &state)
    finalized = true
    return bytes
  }
}

public struct SHA512: DigestAlgorithm
{
  private var state = CC_SHA512state_st()
  private var finalized = false

  public init()
  {
    CC_SHA512_Init(&state)
  }

  public mutating func combine(bytes: UnsafeRawBufferPointer)
  {
    assert(!finalized, "attempted to add to a finalized DigestAlgorithm in \(#function)")
    CC_SHA512_Update(&state, bytes.baseAddress, CC_LONG(bytes.count))
  }

  public mutating func finalize() -> [UInt8]
  {
    assert(!finalized, "attempted to finalize a finalized DigestAlgorithm in \(#function)")
    var bytes = Array<UInt8>(repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
    CC_SHA512_Final(&bytes, &state)
    finalized = true
    return bytes
  }
}
