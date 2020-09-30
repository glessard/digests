# Digests
[![Build Status](https://travis-ci.org/glessard/digests.svg?branch=master)](https://travis-ci.org/glessard/digests)

Swift wrapper for CommonCrypto's digest algorithms API, inspired by Swift 4.2's improved `Hashable` and `Hasher` API.

Works with Swift 4.1 and up. (Tested up to Swift 5.3).

Why would one want this given that CryptoKit and SwiftCrypto exist?
Well, I need to support something older than iOS 13 -- every bit helps.
