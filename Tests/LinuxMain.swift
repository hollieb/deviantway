#if os(Linux)

import XCTest
@testable import DeviantArtApiTests

XCTMain([
    testCase(ConnectionTests.allTests),
])

#endif
