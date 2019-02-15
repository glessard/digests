import XCTest
import Digests

private let text = """
                   Lorem ipsum dolor sit amet, eam at tota veri epicurei, nusquam expetenda te his. \
                   In vis quis affert pericula. Ad mei graecis gloriatur. Alia equidem.
                   """

private let SHA512Digest = """
                           c301c3c9afecf780e585a07fb327e980493c1ab8f7aa75e87946bbb2118f5434\
                           4d86994a8f12c851549c0e507fc9578ec2d77a85e13e567b1f58f4b2b8ebe17d
                           """

final class DigestsTests: XCTestCase
{
  func testGeneratorAndDigest()
  {
    var generator = SHA512()
    generator.combine(with: text)
    let digest1 = Digest(generator)
    generator.combine(bytesOf: 0)
    let digest2 = Digest(generator)

    XCTAssert(digest1 != digest2)
    XCTAssert(digest1.hexString() == SHA512Digest)
  }

  func test1ShotBytes()
  {
    let bytes = text.flatMap { $0.unicodeScalars.map(UInt8.init) }
    let digest = SHA512.digest(bytes: bytes)
    XCTAssert(digest.hexString() == SHA512Digest)
  }

  func test1ShotData()
  {
    let data = text.data(using: .utf8) ?? Data()
    let digest = SHA512.digest(data: data)
    let string = digest.data.reduce(into: "", { $0.append(String(format: "%02x", $1)) } )
    XCTAssert(string == SHA512Digest)
  }

  func test1ShotString()
  {
    let digest = SHA512.digest(value: text)
    XCTAssert(digest.hexString() == SHA512Digest)
  }

  func test1ShotURL() throws
  {
    guard let url = URL(string: "https://www.google.com/") else { throw NSError() }
    let digest = MD5.digest(value: url)
    XCTAssert(digest.hexString() == "d75277cdffef995a46ae59bdaef1db86")
  }

  func test1ShotURBP()
  {
    let data = text.data(using: .utf8) ?? Data()
#if swift(>=5.0)
    let digest = data.withUnsafeBytes { SHA512.digest(bytes: $0) }
#else
    let digest = data.withUnsafeBytes {
      SHA512.digest(bytes: UnsafeRawBufferPointer(start: $0, count: data.count))
    }
#endif
    XCTAssert(digest.hexString() == SHA512Digest)
  }

  func testHashBuffer()
  {
    let data = text.data(using: .utf8).map(Array.init) ?? []
    let digest = data.withUnsafeBufferPointer {
      buffer -> Digest in
      var generator = SHA512()
      generator.combine(with: buffer)
      return generator.digest()
    }
    XCTAssert(digest.hexString() == SHA512Digest)
  }
}
